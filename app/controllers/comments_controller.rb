class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @new_comment = params.require(:comment).permit(:text)
    @post = Post.find(params.require(:post_id))
    @comment = Comment.new(author: current_user, post: @post, text: @new_comment[:text])
    if @comment.save
      flash[:success] = 'Comment created succefully!'
      redirect_to user_post_path(@post, id: params.require(:post_id))
    else
      flash.now[:error] = "The comment couldn't be created!"
    end
  end
end
