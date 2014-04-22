class HomeController < ApplicationController
  def index
    @topics = Topic.all
    @questions = Question.all
    @answers = Answer.all
  end
end
