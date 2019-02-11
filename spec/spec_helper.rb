ENV["ACTIVE_RECORD_ENV"] = "test"

require_relative '../config/environment'
require 'database_cleaner'

RSpec.configure do |config|

  DatabaseCleaner.strategy = :truncation

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation, {except: %w[curriculums lessons units topics]})
  end

  config.before do
    # if Lesson.count == 0
    #   puts "There are no lessons in the database. Would you like to seed the curriculum? (Y/N)"
    #   input = $stdin.gets.strip
    #   CurriculumParser.new.seed_curriculum if input.upcase == "Y"
    # end
    DatabaseCleaner.clean_with(:truncation, {except: %w[curriculums lessons units topics]})
  end

  config.after do
    DatabaseCleaner.clean_with(:truncation, {except: %w[curriculums lessons units topics]})
  end

end

