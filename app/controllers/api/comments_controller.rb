class Api::CommentsController < Api::ApplicationController
  def index
    render json: Comment.where(post: params[:post_id])
  end

  def create
    @new_comment = Comment.new(author_id: params[:user_id].to_i, post_id: params[:post_id].to_i,
                               text: params[:comment_text])

    if @new_comment.save
      render json: 'Comment created successfully'
    else
      render json: 'Failed!'
    end
  end
end
