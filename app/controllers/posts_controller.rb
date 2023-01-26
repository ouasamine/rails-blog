class PostsController < ApplicationController
  def index
    @single_user = User.find(params[:user_id].to_i)
    @user_posts = Post.where(author: @single_user)
  end

  def show
    @single_post = Post.find(params[:id].to_i)
    @post_comments = Comment.where(post: @single_post)
  end
end
