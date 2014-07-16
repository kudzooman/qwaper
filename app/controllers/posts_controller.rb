class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).paginate(page: params[:page], per_page: 20)
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
  @post = current_user.posts.build(post_params)
  authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to posts_path
    else
      flash[:error] = "Error! That was either way too short or over 200 characters."
      render :new
      #redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(post_params)
      redirect_to posts_path

    # elsif editing from user show view, redirect_to back
    
    else
      flash[:error] = "Try again"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    body = @post.body

    authorize @post
    if @post.destroy
      flash[:notice] = "qwap all gone."
      redirect_to posts_path
    else
      flash[:error] = "There was an error."
      redirect_to posts_path
      #render :index
    end
  end

  def oldest
    if default_scope { order('created_at ASC') }
    render :index
  end
  end

  def newest
    if default_scope { order('created_at DESC') }
    render :index
  end
  end

  def best

  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
