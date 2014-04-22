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

  def create
    @question = current_user.questions.build(params.require(:question).permit(:title, :answered)
  end

  def edit
  end
end
