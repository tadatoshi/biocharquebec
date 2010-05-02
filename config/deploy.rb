set :application, "biocharquebec"
set :repository,  "git@github.com:tadatoshi/biocharquebec.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "~/public_html/#{application}"

role :web, "ec2-174-129-235-98.compute-1.amazonaws.com"                          # Your HTTP server, Apache/etc
role :app, "ec2-174-129-235-98.compute-1.amazonaws.com"                          # This may be the same as your `Web` server
role :db,  "ec2-174-129-235-98.compute-1.amazonaws.com", :primary => true # This is where Rails migrations will run
# role :db,  "tadatoshi.ca"

# ssh_options[:identity_file] = "/Users/tadatoshi/.amazon/elastic_compute_cloud/tadatoshikey.pem"
set :user, "ubuntu"


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do

  task :copy_database_configuration do
    production_db_config = "#{deploy_to}/shared/db/production.database.yml"
    run "cp #{production_db_config} #{release_path}/config/database.yml"
  end
  
  after "deploy:update_code" , "deploy:copy_database_configuration"
  
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
      run "thin #{action} -c #{current_path} -C #{current_path}/config/thin.yml"
    end
  end
end