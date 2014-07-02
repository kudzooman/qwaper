class UsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @users = User.paginate(page: params[:page], per_page: 15)
  end

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
    @posts = @user.posts
  end


  private

  def user_params
    params.require(:user).permit(:name)
  end
end
