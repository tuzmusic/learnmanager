ENV["ACTIVE_RECORD_ENV"] = "test"

require_relative '../config/environment'

RSpec.configure do |config|

  config.before(:suite) do
    clear_db
    system("rake db:migrate")
    DB.tables
  end

end

def __
  raise "Replace __ with test code."
end

def clear_db
  File.open("db/learnmanager-test.db", "w+") {|f| f.puts ""}
end

