class User < ActiveRecord::Base
  # t.string :email
  # t.string :password

  # t.integer :topic_id
  # t.integer :unit_id
  # t.string :lesson_id
  # t.integer :progress_id  

  has_one :topic
  has_one :unit
  has_one :lesson
end