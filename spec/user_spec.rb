require 'spec_helper'

RSpec.describe User do
  describe "self.make" do
    it "creates a user, using user info from the environment and progress info from the curriculum hash" do
      User.make
      expect(User.count).to eq 1
      expect(User.email).to eq "tuzmusic@gmail.com"
      expect(User.lesson).to eq Lesson.find(44085) # this will obviously change once I complete more lessons!!!!!! 
    end
  end

  describe "update" do
    it "gets the current curriculum info" do
      
    end
    
    it "updates the user's progress" do
      
    end

    it "has a sister function: Curriculum#update" do
      
    end
  end
end