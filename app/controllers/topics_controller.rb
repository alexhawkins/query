class TopicsController < ApplicationController
  def index
    @topics = Topic.alphabetically.all
  end

  def show
    @topic = Topic.find(params[:id])
    #eager loading, take advantage of later
    #@questions = @topic.questions
    @questions = @topic.questions.includes(:user).includes(:answers)
  end

  def new
  end

  def edit
  end
end
