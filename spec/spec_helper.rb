ENV["ACTIVE_RECORD_ENV"] = "test"

require_relative '../config/environment'
require 'database_cleaner'

RSpec.configure do |config|

  DatabaseCleaner.strategy = :truncation

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, {except: %w[curriculums]})
  end

  config.before do
    DatabaseCleaner.clean_with(:truncation, {except: %w[curriculums]})
  end

  config.after do
    DatabaseCleaner.clean_with(:truncation, {except: %w[curriculums]})
  end

end

