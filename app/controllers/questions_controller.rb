class QuestionsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @questions = @topic.questions
    authorize @questions
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @question = Question.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @question = Question.new
    authorize @question
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @question = current_user.questions.build(question_params)
    @question.topic = @topic
    authorize @question
    if @question.save
       flash[:notice] = "Question was saved."
       redirect_to @topic
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @question = Question.find(params[:id])
    authorize @question
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @question = Question.find(params[:id])
    authorize @question
    if @question.update_attributes(question_params)
      flash[:notice] = "Question was saved."
      redirect_to topic_questions_path(@topic)
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :edit
    end
  end

  private 

  def question_params
    params.require(:question).permit(:title, :body, :topic_id, :answered)
  end
end
