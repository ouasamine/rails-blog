class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == '1'
      @greetings = 'User number 1'
    end
  end
end
