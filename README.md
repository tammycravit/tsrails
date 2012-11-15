**TSRails** is a base Rails project that you can upgrade. It is used by
[Taylored Software][] as a foundation for their Rails development
efforts.

**TSRails** is based upon the excellent [suspenders][] gem from
[thoughtbot][], extended and modified to include other setup tasks commonly
performed in Taylored Software's Rails environment.

Using TSRails
-------------

To create a new project first install tsrails:

      gem install tsrails

Then run:

      tsrails create projectname

or:

      tsrails new projectname

This will create a project in `projectname`, and will check it into version
control (Git) using the settings specified in the configuration file (see
below.)

Configuration
=============

The **TSRails** gem requires several configuration options which define things
like the staging server, Git username, etc. THese are defined in a
configuration file, ~/.tsrails.yml, which is automatically generated if it
is not present.

The configuration file should contain the following keys:

- **staging_server** - The hostname of the Git/staging Web server
- **staging_ssh_user** - The ssh user to use for accessing the remote server
- **remote_git_dir** - The root of the Git directory tree on the remote server
- **remote_apache_dir** - The root of the Apache directory tree on the remote
  server
- **test_app_domain** - The domain of the remote server (used for generating
  an Apache/mod_passenger configuration for the test site.

As mentioned above, this configuration file is automatically generated if it's
not present when `tsrails` runs. However, the generated configuration file is
almost certainly incorrect, so tsrails will abort after generating a new
configuration file to allow you to edit it.

About TSRails
-------------

**TSRails** was created for use at [Taylored Software][] as a baseline application
setup, with reasonable default plugins that the majority (if not all) of our
applications used, as well as best-practice configuration options.

Although **TSRails** has been packaged as a general-purpose gem, it does (at
present) make several assumptions that are specific to Taylored Software's
server configuration and which may not be what you want:

- The Git repository and Web server live on the same server
- The Web site is to be deployed with Apache 2.2/mod_passenger and
  with Ruby Enterprise Edition installed in /opt/ree

Included Gems
-------------

TSRails includes the following gems in the generated application along with
their associated configuration files:

- **User Login and Authentication**
	- Clearance
- **Template and Markup Processing**
	- HAML
	- RedCloth
- **Form Enhancements**
	- Paperclip
	- tiny_mce
	- flutie
	- formtastic
- **View Enhancements**
	- WillPaginate
- **Application Infrastructure**
	- Hpricot
	- exception_notification
	- Nokogiri
	- Ryan Bates's `nifty-generators`
- **Database Adapters**
	- SQLite3 (development and test environments)
	- MySQL (production environment)
- **Deployment**
	- Capistrano
	- Heroku
	- Mongrel and mongrel_cluster

TSRails also includes the following BDD/testing tools:

- factory_girl
- RSpec
- Shoulda
- capybara
- Timecop

Initializers (in config/initializers)
-------------------------------------

- `backtrace_silencers.rb`: Configured to silence backtraces from Shoulda and
  factory_girl
- `app_config.rb`: Loads application settings from config/app_config.yml
- `clearance.rb`: Configuration for Clearance
- `haml_options.rb`: Configures HAML options
- `jquery.rb`: Substitutes jQuery for Prototype.JS
- `noisy_attr_accessible.rb`: Logs protected attribute assignments
- `requires.rb`: Autoloads libraries in `lib/` and `lib/extensions`

Version History
---------------

- 2.0.3 - 2012 Nov 15 - Modified to remove RVM integration since we're using rbenv now
- 2.0.2 - 2012 Feb 23 - Minor release fix
- 2.0.1 - 2012 Feb 23 - Modified template file to more easily change Ruby versions
- 2.0.0 - 2012 Jan 30 - Updated for Rails 3.2
- 1.2.2 - 2011 Jan 11 - Using jquery-rails gem instead of doing the heavy lifting ourselves
- 1.2.1 - 2010 Dec 19 - Replaced RVM Ruby 1.9.2-head with REE 1.8.7-head
- 1.2.0 - 2010 Dec 11 - Replaced `defined_app_name` with `@app_name` throughout,
  added `ask_with_default` helper, various fixes for Ruby 1.9.2 compatibility
- 1.1.2 - 2010 Nov 19 - Change .rvmrc template to use Rails 1.9.2-head, and
  update a few things in the Gemfile
- 1.1.1 - 2010 Nov 11 - Prepare test DB after installing Clearance, change `RAILS_ROOT` to
  `::Rails.root.to_s`
- 1.1.0 - 2010 Nov 11 - Fixed various bugs in the code generation
- 1.0.6 - 2010 Nov 10 - Fixed a bug with autotest failing
- 1.0.5 - 2010 Nov 10 - Fixed a template bug and updated the readme
- 1.0.4 - 2010 Nov 10 - Added configuration file
- 1.0.3 - 2010 Nov 10 - Initial public version

[Taylored Software]: http://www.taylored-software.com/
[thoughtbot]: http://www.thoughtbot.com/
[suspenders]: https://github.com/thoughtbot/suspenders
