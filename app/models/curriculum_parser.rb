require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'json'
require_relative 'lesson'
require_relative '../../config/environment'

Capybara.run_server = false
Capybara.app_host = 'http://www.google.com'

class CurriculumParser < LearnScraper
  @curriculum_hash

  def curriculum_hash
    log_in
    hash_string = s.body.split('gon.track_nav_data=').last.split('gon.track_nav_current_lesson_id').first
    @curriculum_hash ||=  JSON.parse(/\{.*\}/.match(hash_string)[0])
  end

  def seed_curriculum
    binding.pry
    curriculum_hash['topics'].each do |topic_hash|
      binding.pry
      Topic.create ActiveSupport::JSON.decode(topic_hash)
      topic_hash['units'].each do |unit_hash|
        Topic.units.create ActiveSupport::JSON.decode(unit_hash)
        unit_hash['lessons'].each do |lesson_hash|
          Units.lessons.create ActiveSupport::JSON.decode(lesson_hash)
        end
      end
    end
  end
end