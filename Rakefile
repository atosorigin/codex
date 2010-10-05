# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

Dir[File.join(RAILS_ROOT, 'gems', 'ruby','1.8','gems', '*', 'rails', '..', 'tasks', '*.rake')].sort.each do |tasks|
  load tasks
end
