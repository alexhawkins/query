class AnswersController < ApplicationController
  def index
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @question = Question.find(params[:id])
    @answer = Answer.find(params[:id])
  end

  def new
  end

  def edit
  end
end
