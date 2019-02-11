require 'spec_helper'

RSpec.describe CurriculumParser do

  let(:cp) { CurriculumParser.new }

  before :each do
    DatabaseCleaner.clean_with(:truncation, {except: %w[curriculums]})
    cp.seed_curriculum
  end
    
  describe "seed_curriculum" do

    it "creates the curriculum" do
      expect(Curriculum.first.title).to eq "Full Stack Web Development V6"
    end

    it "creates the topics" do
      expect(Topic.find(44341).title).to eq "Redux" 
    end
    
    it "creates the units" do
      expect(Unit.find(44430).title).to eq "Redux Final Project"
    end

    it "creates the lessons" do
      expect(Lesson.find(44431).title).to eq "React Redux Portfolio Project" 
    end

  end

  describe "update_curriculum" do
    let(:original_hash) { cp.curriculum_hash # should come from the database (not, by the way, from the json file) }
    let(:current_lesson_id) { original_hash['most_recent_progress']['lesson_id'] }

    before :each do
      original_hash['most_recent_progress']['lesson_id'] = "FUDGE" 
      original_hash['topics'].first['units'].first['lessons'].first['complete'] = 'false'
    end
    
    it "updates the curriculum_hash from online" do
      cp.update_curriculum

      updated_hash = cp.curriculum_hash

      # check that we haven't recreated the original_hash after the before block
      expect(original_hash['most_recent_progress']['lesson_id']).to eq 'FUDGE'
      expect(original_hash['topics'].first['units'].first['lessons'].first['complete']).to eq 'false'

      expect(updated_hash['most_recent_progress']['lesson_id']).to eq current_lesson_id
      expect(updated_hash['topics'].first['units'].first['lessons'].first['complete']).to eq 'true'
    end

    it "updates the Curriculum hash in the database" do
      hash = Curriculum.first.hash_string
      bad_string = hash_string.gsub ('"title": "Full Stack Web Development V6"', "title": "1234567890")
      Curriculum.first.update(hash_string: bad_string)

      cp.update_curriculum
      new_hash = JSON.parse(/\{.*\}/.match(Curriculum.first.hash_string)[0])
      expect(new_hash['title']).to eq "Full Stack Web Development V6"
    end

    it "updates all the objects in the database (ALL OF THEM???)" do
      expect(false).to eq true
    end
  end
end