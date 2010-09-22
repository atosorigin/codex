set :application, "codex"

# Require default headshift recipes from the headshift-rails gem
require 'headshift/capistrano/base'
require 'headshift/capistrano/database'

# overriding repository in order to deploy from github
set :repository,  "git@github.com:Junius/#{application}.git"


after "deploy:update_code" do
  bundle
  deploy.web.disable
end

after "deploy:symlink" do
  deploy.web.enable
end

desc "Install bundled gems into ./gems"
task :bundle do
  run "ln -s #{shared_path}/gems #{release_path}/gems"
  run "cd #{release_path}; bundle install --path gems --without test development cucumber"
end

after "deploy:setup", "setup_gem_directories"
task :setup_gem_directories do
  run "mkdir -p #{shared_path}/gems"
end

