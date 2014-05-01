class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :answer_votes, dependent: :destroy
  has_many :topics, through: :answer_topics 
  after_create :create_vote
  #mount_uploader :image, ImageUploader
  default_scope { order('rank DESC') }

  def up_votes
    # find all cases of votes where there is a database value of 1
    self.answer_votes.where(value: 1).count
  end

  def down_votes
    self.answer_votes.where(value: -1).count
  end

  #see the sum of all up and down votes in our Answer database
  def points
    self.answer_votes.sum(:value).to_i
  end

  def update_rank
   
    new_rank = points
    self.update_attribute(:rank, new_rank)
  end

  private

  # whoever created a post, should automatically be set to "voting" it up
  def create_vote
    user.answer_votes.create(value: 1, answer: self)
  end

end