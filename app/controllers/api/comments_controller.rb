class Api::CommentsController < Api::ApplicationController
  def index
    render json: Comment.where(post: params[:post_id])
  end

  def create
    
  end
end
