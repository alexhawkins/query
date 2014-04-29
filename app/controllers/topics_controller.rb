class TopicsController < ApplicationController
  def index
    @topics = Topic.alphabetically
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    #eager loading, take advantage of later
    #@questions = @topic.questions
    @questions = @topic.questions.includes(:user).includes(:answers).paginate(page: params[:page], per_page: 5)
    @new_question = Question.new
   #@answers = @q@questions.find(params[:question_id)]uestion.answers
    @new_answer = Answer.new
    #@answers = @questions.answers
  end

  def new
  end

  def edit
  end
end
