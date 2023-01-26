class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @single_user = User.find(params[:id].to_i)
    @user_posts = @single_user.latest_posts
  end
end
