class QuestionPolicy < ApplicationPolicy
  #makes sure that our questions are viewable to the public
  def index?
    true
  end

end