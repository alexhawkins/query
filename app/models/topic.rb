class Topic < ActiveRecord::Base
  #has_and_belongs_to_many :questions //use when using simple many-to-many associations
  # a topic does have many questions as long as we go through question_topics to get there
  has_many :question_topics
  has_many :questions, through: :question_topics
  #sort alphabetically
  scope :alphabetically, -> { order('title ASC') }

end
