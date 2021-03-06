class UsersController < ApplicationController
  before_filter :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(current_user)
    else
      render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    #@answer = @user.answers.find(params[:id])
    #@questions = @user.questions.visible_to(current_user)
  end

  def index
  # @users = User.top_rated.paginate(page: params[:page], per_page: 10)
  end

  private
  # Make sure, here, to add any datbase columns you want the user to be able to update.
  # For example, a user can add an about me section which gets stored in the :description
  # column of our database. In order for this to happen, we need to add it to our allowed
  # params for a user. We can see below that a User can edit his name, avatar, and author description.
  # After migrating a new param to your database, make sure to add it here. You can
  # then call the param by using something like this: user.description or,
  # because users and posts have been associated, post.user.avatar, @post.user.name,
  # post.user.description?
  def user_params
    params.require(:user).permit(:name, :avatar, :description, :email_favorites)
  end
end