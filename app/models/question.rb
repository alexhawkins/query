class Question < ActiveRecord::Base
  #has_and_belongs_to_many :topics # topic_id foreign key
  has_many :question_topics
  # a question does have many topics as long as we go through question_topics to get there
  has_many :topics, through: :question_topics 
  belongs_to :user # user_id foreign key
  has_many :answers

  default_scope { order('created_at DESC') }

  # override to_params so that it provides a 'munged' version of the question title,
  # courtesy of the parameterize method

end
