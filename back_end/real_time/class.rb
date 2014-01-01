require 'active_record'
require 'open3'
# Change the db in Production
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../opt/db/development.sqlite3')

Dir["../opt/app/models/*.rb"].each {|file| require file if (file != '../opt/app/models/user.rb' && file != '../opt/app/models/admin_user.rb') }

# require '../opt/app/models/'
# The class GitUser will be used for each user who joins the web server
# id: to uniquely identify each user
require_relative 'git_user'
require_relative 'directory'