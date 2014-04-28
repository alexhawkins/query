class QuestionsController < ApplicationController
  respond_to :html, :js

  def index
    @topic = Topic.find(params[:topic_id])
    @questions = @topic.questions
    authorize @questions
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @question = Question.new
    authorize @question
  end

  def create
    @question = current_user.questions.build(question_params)
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
    @question = Question.find(params[:id])
    authorize @question

    respond_with(@question) do |format|
      format.html { redirect_to [@question]}
      format.js
    end
  end

  def update
    @question = Question.find(params[:id])
    authorize @question
    if @question.update_attributes(question_params)
      #flash[:notice] = "Question was saved."
      #redirect_to topic_question_path(@topic, @question)
    else
      #flash[:error] = "There was an error saving the question. Please try again."
      #render :edit
    end

    respond_with(@question) do |format|
      format.html { redirect_to [@question]}
      format.js
    end

  end

  private 

  def question_params
    params.require(:question).permit(:title, :body, :answered)
  end
end
