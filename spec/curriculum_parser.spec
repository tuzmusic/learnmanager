require 'spec_helper'

RSpec.describe CurriculumParser do

  let(:cp) { CurriculumParser.new }
    
  describe "seed_curriculum" do
    it "creates the topics" do
      cp.seed_curriculum
      expect(Topic.first.title).to eq "Welcome" 
    end
  end
end