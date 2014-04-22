class Question < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :answers

  default_scope { order('created_at DESC') }
end
