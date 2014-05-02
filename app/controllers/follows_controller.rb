class FollowsController < ApplicationController
  respond_to :html, :js

  def create
    @question = Question.find(params[:question_id])
    follow = current_user.follows.build(question: @question)
      
    if follow.save
      ##flash[:notice] = "Followed Question"
      ##redirect_to :back
    else
      ##flash[:error] = "Unable to add follow. Please try again."
      ##redirect_to :back
    end

    respond_with(@question) do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    follow = current_user.follows.find(params[:id])

    if follow.destroy
      ##flash[:notice] = "Unfollowed Question"
      ##redirect_to :back
    else
      ##flash[:error] = "Unable to unfollow. Please try again."
      ##redirect_to :back
    end
    respond_with(@question) do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
