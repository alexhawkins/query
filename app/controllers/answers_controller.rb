class AnswersController < ApplicationController
   #this enables the controller to respond to both html and js
  respond_to :html, :js

  def show
    @topic = Topic.find(params[:topic_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:question_id])
    @answers = @question.answers
    @answer = current_user.answers.build(params.require(:answer).permit(:body, :question_id, :user_id))
    @answer.question = @question
    @new_answer = Answer.new

    if @answer.save
      flash[:notice] = "Answer was created."
    else
      flash[:error] = "There was an error saving the answer. Please try again."
    end

    respond_with(@answer) do |format|
      format.html { redirect_to [@topic, @question]}
      format.js
    end
  end

  def edit
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @question = @topic.questions.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    authorize @answer
    if @answer.destroy
      flash[:notice] = "Answer was removed."
    else
      flash[:error] = "Answer couldn't be deleted. Try again."
    end

    respond_with(@answer) do |format|
      format.html { redirect_to [@topic, @question]}
      format.js
    end

  end

  
end
