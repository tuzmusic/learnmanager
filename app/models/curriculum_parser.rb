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
    curriculum_hash['topics'].each do |topic_hash|
      units = topic_hash.delete 'units'
      topic = Topic.create topic_hash
      units.each do |unit_hash|
        lessons = unit_hash.delete 'lessons'
        unit = topic.units.create unit_hash
        
        lessons.each do |lesson_hash|
          unit.lessons.create lesson_hash
        end
      end
    end
    binding.pry
  end
end