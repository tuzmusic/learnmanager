require 'spec_helper'

RSpec.describe Lesson do
  let(:cp) { CurriculumParser.new }

  before :each do
    # cp.seed_curriculum
  end

  describe "url" do
    it "returns the full url for the lesson" do
      expect(Lesson.find(44085).url).to eq "https://learn.co/tracks/full-stack-web-development-v6/javascript/principles/scope"
    end
  end

end