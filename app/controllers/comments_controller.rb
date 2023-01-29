class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment_params = params.require(:comment).permit(:text)
    @post = Post.find(params.require(:post_id))
    @comment = Comment.new(author: current_user, post: @post, text: @comment_params[:text])
    if @comment.save
      flash[:success] = 'Comment created succefully!'
      redirect_to post_path(@post)
    else
      flash.now[:error] = "The comment couldn't be created!"
    end
  end
end
