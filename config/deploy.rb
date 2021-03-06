task :staging do
  set :rails_env, "staging"
  set :location, "staging.biocharquebec.org"
  set_role
  set :ruby_directory, "ruby-1.9.2-p0"
  set_default_environment
  set :application, "biocharquebec"
  set :deploy_to, "~/public_html/#{application}"
  set :thin_config, "thin_staging.yml"
end

task :production do
  set :rails_env, "production"
  set :location, "biocharquebec.org"
  set_role
  set :ruby_directory, "ruby-1.9.2-p0"
  set_default_environment
  set :application, "biocharquebec_production"
  set :deploy_to, "~/public_html/#{application}"
  set :thin_config, "thin_production.yml"  
end

task :set_default_environment do
  set :default_environment, { 
    'PATH' => "~/.rvm/rubies/#{ruby_directory}/bin:~/.rvm/gems/#{ruby_directory}/bin:~/.rvm/bin:$PATH",
    'RUBY_VERSION' => "ruby 1.9.2",
    'GEM_HOME' => "~/.rvm/gems/#{ruby_directory}",
    'GEM_PATH' => "~/.rvm/gems/#{ruby_directory}" 
  }
end

set :repository,  "git@github.com:tadatoshi/biocharquebec.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

task :set_role do
  role :web, location                          # Your HTTP server, Apache/etc
  role :app, location                          # This may be the same as your `Web` server
  role :db,  location, :primary => true # This is where Rails migrations will run
  # role :db,  "tadatoshi.ca"
end

# ssh_options[:identity_file] = "/Users/tadatoshi/.amazon/elastic_compute_cloud/tadatoshikey.pem"
set :user, "ubuntu"


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :copy_database_configuration do
#     db_config = "#{deploy_to}/shared/db/#{rails_env}.database.yml"
#     run "cp #{db_config} #{release_path}/config/database.yml"
#     
#     mongoid_config = "#{deploy_to}/shared/db/#{rails_env}.mongoid.yml"
#     run "cp #{mongoid_config} #{release_path}/config/mongoid.yml"
#   end
#   
#   after "deploy:update_code", "deploy:copy_database_configuration"
# 
#   task :symlink_uploads_directory do
#     uploads_directory = "#{deploy_to}/shared/uploads"
#     run "ln -s #{uploads_directory} #{release_path}/public/uploads"
#   end
# 
#   after "deploy:update_code", "deploy:symlink_uploads_directory"
# 
#   task :bundle_install do
#     run "rvmsudo bundle install --gemfile #{release_path}/Gemfile --without development test cucumber"
#   end
# 
#   after "deploy:update_code", "deploy:bundle_install"  
#   
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do

  task :copy_database_configuration do
    db_config = "#{deploy_to}/shared/db/#{rails_env}.database.yml"
    run "cp #{db_config} #{release_path}/config/database.yml"
    
    mongoid_config = "#{deploy_to}/shared/db/#{rails_env}.mongoid.yml"
    run "cp #{mongoid_config} #{release_path}/config/mongoid.yml"
  end
  
  after "deploy:update_code", "deploy:copy_database_configuration"

  task :symlink_uploads_directory do
    uploads_directory = "#{deploy_to}/shared/uploads"
    run "ln -s #{uploads_directory} #{release_path}/public/uploads"
  end

  after "deploy:update_code", "deploy:symlink_uploads_directory"

  task :bundle_install do
    run "rvmsudo bundle install --gemfile #{release_path}/Gemfile --without development test cucumber"
  end

  after "deploy:update_code", "deploy:bundle_install"

  %w(start stop restart).each do |action| 
    desc "#{action} the Thin processes"  
    task action.to_sym do
      find_and_execute_task("thin:#{action}")
    end
  end
end

namespace :thin do  
  %w(start stop restart).each do |action| 
  desc "#{action} the app's Thin Cluster"  
    task action.to_sym, :roles => :app do  
      run "thin #{action} -c #{current_path} -e #{rails_env} -C #{current_path}/config/#{thin_config}"
    end
  end
end