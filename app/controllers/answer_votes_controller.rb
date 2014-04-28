class AnswerVotesController < ApplicationController
  before_filter :setup

  def up_vote
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    update_vote(-1)
    redirect_to :back
  end

  private

  def setup
    if current_user
      #@topic = Topic.find(params[:topic_id])
      @question = Question.find(params[:question_id])
      @answer = @question.answers.find(params[:answer_id])
      #look for an existing vote in our database by this person so that we don't create multiple
      @answer_vote = @answer.answer_votes.where(user_id: current_user.id).first
    else
      redirect_to new_user_session_path
    end

  end

  def update_vote(new_value)
    if @answer_vote # if it exists, update it
      authorize @answer_vote, :update? #authorize to make sure only members vote
      @answer_vote.update_attribute(:value, new_value)
    else # create it
      #authorize @answer_vote, :create? #authorize to make sure only members vote
      #@answer_vote = current_user.answer_votes.create(value: new_value, answer: @answer)
      # use build instead so that we can authorize an actual vote before it is saved
      # Instead of one call to create, we build the Vote object, then authorize it, then save it
      @answer_vote = current_user.answer_votes.build(value: new_value, answer: @answer)
      @answer_vote.save
    end
  end
end