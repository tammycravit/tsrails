set :scm,                   :git
set :repository,            "ssh://<%= STAGING_SERVER_NAME %>/<%= REMOTE_GIT_DIR %>/<%= defined_app_name.downcase %>.git"
set :branch,                "master"
set :git_enable_submodules, 1    

ssh_options[:compression] = false
ssh_options[:auth_methods] = %w{publickey password keyboard-interactive}

role :web,            "<%= STAGING_SERVER_NAME %>"
role :app,            "<%= STAGING_SERVER_NAME %>"
role :db,             "<%= STAGING_SERVER_NAME %>", :primary => true
set(:deploy_to)       { "<%= REMOTE_APACHE_DIR %>/<%= defined_app_name %>.taylored-software.com" }
set :user,            "<%= STAGING_SSH_USER %>"
set :use_sudo,        false
set :keep_releases,   12

namespace :bundler do
  task :install_gem do
    run("sudo /opt/ree/bin/gem install bundler --source=http://gemcutter.org")
  end

  task :bundle_new_release, :roles => :app, :except => { :no_release => true } do
    run("cd #{release_path} && /opt/ree/bin/bundle install")
  end
end

after 'deploy:setup',         'bundler:install_gem'
after 'deploy:update_code',   'bundler:bundle_new_release'
after 'deploy',               'deploy:cleanup'
