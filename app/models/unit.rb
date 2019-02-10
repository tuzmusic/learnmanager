class Unit < ActiveRecord::Base
  has_many :lessons
  belongs_to :topic
  
end