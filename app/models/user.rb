class User < ActiveRecord::Base
  # t.string :email
  # t.string :password

  # t.integer :topic_id
  # t.integer :unit_id
  # t.string :lesson_id
  # t.integer :progress_id  

  belongs_to :topic
  belongs_to :unit
  belongs_to :lesson

  def self.make
    parser = CurriculumParser.new
    hash = parser.curriculum_hash # fetches from existing Curriculum object if there is one

  end

end