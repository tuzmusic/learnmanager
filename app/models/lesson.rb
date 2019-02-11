class Lesson < ActiveRecord::Base
  belongs_to :unit

  def url
    "https://learn.co/tracks/" + [Curriculum.first.slug, unit.topic.slug, unit.slug, slug].join('/')
  end
end  
