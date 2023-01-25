class PostsController < ApplicationController
  def index
    @single_user = User.find(params[:user_id].to_i)
    @user_posts = Post.where(author: @single_user)
  end

  def show; end
end
