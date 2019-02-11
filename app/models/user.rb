class User < ActiveRecord::Base
  # t.string :email
  # t.string :password

  # t.integer :topic_id
  # t.integer :unit_id
  # t.string :lesson_id
  # t.integer :progress_id  

  belongs_to :lesson
  
  def topic
    lesson.topic
  end
  
  def unit
    lesson.topic.unit
  end

  def self.make
    parser = CurriculumParser.new
    hash = parser.curriculum_hash # fetches from existing Curriculum object if there is one
    progress = hash['most_recent_progress']
    User.create(email: ENV['LEARN_USERNAME'], password: ENV['LEARN_PASSWORD'], lesson_id: progress['lesson_id'])
  end

  def fetch
    parser = CurriculumParser.new
    parser.log_in
    
  end

end