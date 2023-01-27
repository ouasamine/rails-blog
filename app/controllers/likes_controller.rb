class LikesController < ApplicationController
  def create
    @current_post = Post.find(params.require(:post_id))
    @new_like = Like.new(author: current_user, post: @current_post)
    if @new_like.save
      flash[:success] = 'Post liked succefully!'
    else
      flash.now[:error] = 'Something ent wrong!'
    end
    redirect_to users_path
    nil
  end
end
