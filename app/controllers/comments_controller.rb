class CommentsController < ApplicationController

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 20)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = current_user.comments.build( comment_params )
    @comment.post = Post.find(params[:post_id])
    @new_comment = Comment.new

    authorize @comment 

    if @comment.save
      flash[:notice] = "Bam!"
    else
      flash[:error] = "What was that?! Maybe too many or too few characters. Try again."
    end
        redirect_to post_comments_path 
  end

  def edit
    @comment.post = Post.find(params[:post_id])
    #@comment = Comment.find(params[:id])
    authorize @comment
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment
    if @comment.update_attributes(comment_params)
      redirect_to post_comments_path

    # elsif editing from user show view, redirect_to back
    
    else
      flash[:error] = "Try again"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    body = @comment.body

    authorize @comment
    if @comment.destroy
      flash[:notice] = "collab-o-qwap all gone."
      redirect_to post_comments_path
    else
      flash[:error] = "There was an error."
      redirect_to post_comments_path
      #render :index
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
