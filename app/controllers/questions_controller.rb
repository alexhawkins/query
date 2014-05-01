class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    @topic = Topic.find(params[:topic_id])
    @questions = @topic.questions
    authorize @questions
  end

  def show
    get_and_show_answers
  end

  def show_with_button
    get_and_show_answers
  end

  def new
    @question = Question.new
    authorize @question
  end

  def create 
    @question = current_user.questions.build(question_params)
    @question.save!
    @question_topic = QuestionTopic.new(question_id: @question.id, topic_id: params[:topic_id])
    @question_topic.save
    @new_question = Question.new
    authorize @question
    if @question.save
       #flash[:notice] = "Question was saved."
       # redirect to the topic under which this question was created.
       # Since the question is new, it will only have one topic at this
       # point, so lets just grab the last topic created.
    else
      flash[:error] = "There was an error saving the question. Please try again."
      #render :new
    end
    respond_with(@question) do |format|
      format.html { redirect_to topic_path(@question.topics.last) }
      format.js
    end
  end

  def edit
    authorize @question

    respond_with(@question) do |format|
      format.html { redirect_to [@question]}
      format.js
    end
  end

  def update
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
      format.json { head :no_content }
      format.js
    end

  end

   def destroy
    authorize @question
    if @question.destroy
      #flash[:notice] = "Question was removed."
    else
      #flash[:error] = "Question couldn't be deleted. Try again."
    end

    respond_with(@question) do |format|
      format.html { redirect_to @question }
      format.json { head :no_content }
      format.js
    end


  end


  private

  def set_question
      @question = Question.find(params[:id])
  end

  
  def get_and_show_answers
    @answers = @question.answers.paginate(page: params[:page], per_page: 5)
    @answer = Answer.new
    respond_to do |format|
      format.html
      #add so for use with x-editable
      format.json { head :no_content }
      format.js
    end
  end

  def question_params
    params.require(:question).permit(:title, :body, :answered)
  end
end
