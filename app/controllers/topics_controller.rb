class TopicsController < ApplicationController
  def index
    @topics = Topic.alphabetically
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    #eager loading, take advantage of later
    #@questions = @topic.questions
    @questions = @topic.questions.includes(:user).includes(:answers)
   #@question = Question.find(params[:question_id])
   #@answers = @question.answers
    @new_answer = Answer.new
    #@answers = @questions.answers
  end

  def new
  end

  def edit
  end
end
