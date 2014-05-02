class Question < ActiveRecord::Base

  #for searching with ElasticSearch and Searchkick
  #searchkick

  #has_and_belongs_to_many :topics # topic_id foreign key
  has_many :question_topics, dependent: :destroy
  # a question does have many topics as long as we go through question_topics to get there
  has_many :topics, through: :question_topics
  #allows us to manage Topics on our Question form
  accepts_nested_attributes_for :topics
  accepts_nested_attributes_for :question_topics

  belongs_to :user # user_id foreign key
  has_many :answers, dependent: :destroy
  has_many :question_votes, dependent: :destroy
  has_many :follows, dependent: :destroy

  default_scope { order('created_at DESC') }


  # override to_params so that it provides a 'munged' version of the question title,
  # courtesy of the parameterize method


  def up_votes
    # find all cases of votes where there is a database value of 1
    self.question_votes.where(value: 1).count
  end

  def down_votes
    self.question_votes.where(value: -1).count
  end

  def points 
    self.question_votes.sum(:value).to_i
  end

  def update_answer
    self.answer.update_rank
  end

end
