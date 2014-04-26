class QuestionVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
  after_save :update_question

  def update_question
    self.question.update_rank
  end
end
