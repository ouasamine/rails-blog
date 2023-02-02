class Api::PostsController < Api::ApplicationController
  def index
    render json: Post.where(author: params[:user_id])
  end
end
