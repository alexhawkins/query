class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :answer_votes, dependent: :destroy
  has_many :topics, through: :answer_topics 
  
  default_scope { order('rank DESC') }

  def up_votes
    # find all cases of votes where there is a database value of 1
    self.answer_votes.where(value: 1).count
  end

  def down_votes
    self.answer_votes.where(value: -1).count
  end

  def points
    self.answer_votes.sum(:value).to_i
  end

  def update_rank
   
    new_rank = points
    self.update_attribute(:rank, new_rank)
  end

end