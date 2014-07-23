class FollowsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    follow = @user.follows.build(user: current_user)
    authorize follow
    if follow.save
      flash[:notice] = "Following #{@user.name}"
      redirect_to posts_path
    else
      flash[:error] = "Unable to follow. Please try again."
      redirect_to posts_path
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    follow = @user.follows.find(params[:id])
    authorize follow
    if follow.destroy
      flash[:notice] = "Unfollowed"
      redirect_to posts_path
    else
      flash[:error] = "Unable to unfollow. Please try again."
      redirect_to posts_path
    end
  end


end
