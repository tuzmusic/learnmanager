require 'spec_helper'

RSpec.describe CurriculumParser do

  let(:cp) { CurriculumParser.new }

  before :each do
    cp.seed_curriculum
  end
    
  describe "seed_curriculum" do

    it "creates the topics" do
      expect(Topic.find(44341).title).to eq "Redux" 
    end
    
    it "creates the units" do
      expect(Unit.find(44430).title).to eq "Redux Final Project"
    end

    it "creates the lessons" do
      binding.pry
      expect(Lesson.find(44431).title).to eq "React Redux Portfolio Project" 
    end

  end
end