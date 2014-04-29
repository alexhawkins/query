class QuestionTopic < ActiveRecord::Base
  belongs_to :topic
  belongs_to :question

  accepts_nested_attributes_for :topic, :reject_if => :all_blank
end
