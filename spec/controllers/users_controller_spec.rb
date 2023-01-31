require 'rails_helper'

RSpec.describe 'users', type: :request do
  before do 
    @user = User.create(name: "Amine", posts_counter: 0)
    @post = Post.create(title: "First post", author: @user, comments_counter: 0, likes_counter: 0)
  end
  it '/ response status should be ok' do
    get '/users'
    expect(response).to have_http_status(:ok)
  end

  it '/ should render index' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it '/:id response status should be ok' do
    get "/users/#{@user.id}"
    expect(response).to have_http_status(:ok)
  end

  it '/:id should render show' do
    get "/users/#{@user.id}"
    expect(response).to render_template(:show)
  end
end
