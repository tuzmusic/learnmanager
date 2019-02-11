require 'spec_helper'

RSpec.describe Lesson do
  let(:cp) { CurriculumParser.new }

  describe "url" do
    it "returns the full url for the lesson" do
      expect(Lesson.find(44085).url).to eq "https://learn.co/tracks/full-stack-web-development-v6/javascript/principles/scope"
    end
  end

  describe "Lesson management methods" do
    
    describe "clone" do
      it "clones the lesson into the topic/unit folder" do
      end
  
      it "moves into the file directory" do
        expect(`pwd`).to include lesson.slug 
      end
    end
  
    describe "fork" do
      it "creates a fork for the lesson" do
        
      end
  
      it "renames the remotes" do
        remotes = `git remote`
        expect(remotes).to include "origin"
        expect(remotes).to include "learn-co"
        expect(remotes).to_not include "tuzmusic"
      end
    end
  
    describe "get" do
      it "clones and forks the lesson" do
        
      end
    end
  
    describe "open" do
      it "opens the lesson in the IDE" do
        
      end
      
      it "performs setup operations depending on the type/language of the lesson" do
        
      end
    end

  end  

  describe "Curriculum management methods" do
    describe "submit" do
      it "checks the lesson's status from the online info" do
        
      end

      context "tests failing" do
        it "asks if you want to submit even though you have failing tests" do
          
        end
      end

      context "tests passing" do
        it "doesn't ask anything" do
          
        end
      end

      it "submits the pull request" do
        
      end

      it "updates the current lesson object from the online info" do
        
      end

      it "updates the user's progress from the online info" do
        
      end
    end
    
    describe "next" do
      it "returns the next incomplete lesson" do
        
      end
    end

    describe "next-lab" do
      it "returns the next incomplete lab (or codealong?)" do
        
      end
    end
    
  end

end