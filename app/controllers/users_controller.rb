class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

  def update
    authorize @user
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(current_user)
    else
      render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end



  private

  def user_params
    params.require(:user).permit(:name, :email_favorites)
  end
end
