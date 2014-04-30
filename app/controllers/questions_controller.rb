class QuestionsController < ApplicationController
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
    @topic = Topic.find(params[:topic_id])
    @question = Question.new
    @question.topic = @topic
    authorize @question
  end

  def create
    #@topic = Topic.find(params[:id]
    #@topic = Topic.find(params[:id])
    #@topic = Topic.find(params[:topic_id])
    @question = current_user.questions.build(question_params)
    @question.save!
    @question_topic = QuestionTopic.new(question_id: @question.id, topic_id: 12)
    @question_topic.save
    #@topic.questions << @question
    #@topic.questions.save!
    #@question.topics << @topic
    #@question.topic = @topic
    authorize @question
    if @question.save
       flash[:notice] = "Question was saved."
       redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again."
      #render :new
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
  
  def get_and_show_answers
    @question = Question.find(params[:id])
    @answers = @question.answers.paginate(page: params[:page], per_page: 5)
    @answer = Answer.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def question_params
    params.require(:question).permit(:title, :body, :answered)
  end
end
