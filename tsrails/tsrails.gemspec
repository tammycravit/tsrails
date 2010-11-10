Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  s.name              = 'tsrails'
  s.version           = '1.0.4'
  s.date              = '2010-11-10'

  s.summary     = "Generate a Rails app using Taylored Software's best practices."
  s.description = <<-HERE
TSWRails is a base Rails project that you can upgrade. It is used by
Taylored Software to get a jump start on a working app. 
  HERE

  s.authors  = ["Taylored Software"]
  s.email    = 'rubygems@taylored-software.com'
  s.homepage = 'http://github.com/tayloredsoftware/tswrails'

  s.executables = ["tsrails"]
  s.default_executable = 'tsrails'

  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md LICENSE]

  s.add_dependency('rails', '>= 3.0.0')

  # = MANIFEST =
  s.files = %w[
    LICENSE
    README.md
    Rakefile
    bin/tsrails
    lib/constants.rb
    lib/create.rb
    lib/errors.rb
    lib/helpers.rb
    template/files/Gem.gemfile
    template/files/_flashes.html.haml
    template/files/_footer.html.haml
    template/files/_javascript.html.haml
    template/files/_sign_in_out.html.haml
    template/files/apache_config.conf
    template/files/app_config.yml
    template/files/application.html.haml
    template/files/application_helper.rb
    template/files/backtrace_silencers.rb
    template/files/clearance.rb
    template/files/cucumber.yml
    template/files/debug_steps.rb
    template/files/deploy.rb
    template/files/dot.rvmrc
    template/files/factory_girl_steps.rb
    template/files/haml_options.rb
    template/files/jquery.rb
    template/files/mongrel_cluster.yml
    template/files/noisy_attr_accessible.rb
    template/files/prefilled_input.js
    template/files/rcov.opts
    template/files/requires.rb
    template/files/spec.opts
    template/files/spec_helper.rb
    template/files/tiny_mce.yml
    template/tayloredsw_rails.rb
    tsrails.gemspec
  ]
  # = MANIFEST =
end
