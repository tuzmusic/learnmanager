require 'bundler/setup'
Bundler.require

require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'

DBNAME = "learnmanager"

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

def connect
  @connection = ActiveRecord::Base.establish_connection(
    adapter: "sqlite3",
    database: "../db/learnmanager-development.db",
  )
  create_tables unless tables_exist?
end

def tables_exist?
  ActiveRecord::Base.connection.tables.size > 0
end

def create_tables
  puts "database is empty..."
  puts "creating tables"
  path_to_current_file = File.expand_path(File.dirname(__FILE__))
  load("#{path_to_current_file}/../db/schema.rb")
end

connect