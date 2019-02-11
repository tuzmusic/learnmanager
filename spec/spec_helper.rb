ENV["ACTIVE_RECORD_ENV"] = "test"

require_relative '../config/environment'
require 'database_cleaner'
RSpec.configure do |config|

  # config.before(:suite) do
  #   clear_db
  #   # system("rake db:migrate")
  #   # DB.tables
  # end
  DatabaseCleaner.strategy = :truncation

  config.before do
    DatabaseCleaner.clean
  end

  config.after do
    DatabaseCleaner.clean
  end

end

def __
  raise "Replace __ with test code."
end

def clear_db
  binding.pry
  # File.open("db/learnmanager-test.db", "w+") {|f| f.puts ""}
end

def empty_db
  Topic.destroy_all
end
