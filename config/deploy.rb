# Server ruby gem and gemset name
set :rvm_ruby_string, 'ruby-1.9.3-p194@rails326'
# Specifying a system wide install
set :rvm_type, :system

set :application, "search"
set :repository,  "git://github.com/i-arindam/search.git"
set :branch, 'master'
set :scm, :git

# Allows server to do git pull on every deploy, not do a git clone.
set :deploy_via, :remote_cache

set :deploy_to, "/home/aapaurmain/#{application}/capped"

role :web, "dep"
role :app, "dep"
role :db,  "dep", :primary => true

set :user, "deployer"

set :scm_username, "i-arindam"
set :scm_password, "Hu57l3r!am"

# Clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

namespace :deploy do
 #override and empty out stuff we don't use for this
  task :restart, :roles => :app do
  end
  task :start, :roles => [:web, :app] do
  end
  task :stop, :roles => [:web, :app] do
  end
  task :migrate, :roles => :db, :only => { :primary => true } do
  end
  task :migrations, :roles => :db, :only => { :primary => true } do
  end
end
