require 'spec_helper'

RSpec.describe User do
  describe "self.make" do
    it "creates a user, using user info from the environment and progress info from the curriculum hash" do
      user = User.make
      expect(User.count).to eq 1
      expect(user.email).to eq "tuzmusic@gmail.com"
      expect(user.lesson).to eq Lesson.find_by(slug: 'javascript-basics-quiz') # this will obviously change once I complete more lessons!!!!!! 
    end

  end
  
  describe "fetch" do
    
    let(:user) { 
      User.make.update(lesson_id: nil) 
      expect(User.first.lesson).to eq nil 
    }
    
    before :each do
      user.fetch
    end
    
    it "updates the user's progress" do
      expect(user.lesson).to eq Lesson.find_by(slug: 'javascript-basics-quiz') # this will obviously change once I complete more lessons!!!!!! 
    end

    xit "updates the Curriculm object's hash_string property" do
      
    end

    it "has a sister function: Curriculum#update" do
      
    end
  end
end