class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:id])
  end

  def new
  end

  def edit
  end
end
