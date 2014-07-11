class FollowsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    follow = current_user.follows.build(user: @user)
    authorize follow
    if follow.save
      flash[:notice] = "Following"
      redirect_to posts_path
    else
      flash[:error] = "Unable to follow. Please try again."
      redirect_to posts_path
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    follow = current_user.follow.find(params[:id])
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
