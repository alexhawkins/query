class AnswerTopic < ActiveRecord::Base
  belongs_to :topic
  belongs_to :answer
end
