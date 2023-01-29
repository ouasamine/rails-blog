class PostsController < ApplicationController
  def index
    @single_user = User.find(params[:user_id].to_i)
    @user_posts = Post.where(author: @single_user)
  end

  def show
    @current_post = Post.find(params[:id].to_i)
    @post_comments = Comment.where(post: @current_post)
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post_prams = params.require(:post).permit(:title, :text)
    @post = Post.new(author: current_user, title: @post_prams[:title], text: @post_prams[:text], comments_counter: 0,
                     likes_counter: 0)
    if @post.save
      flash[:success] = 'Post created succefully!'
      redirect_to users_path
    else
      flash.now[:error] = "The post couldn't be created!"
    end
  end
end
