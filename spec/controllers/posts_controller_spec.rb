require 'rails_helper'

RSpec.describe 'posts handling', type: :request do
  it '/ response status should be ok' do
    get '/users/:id/posts'
    expect(response).to have_http_status(:ok)
  end

  it '/ should render index' do
    get '/users/:id/posts'
    expect(response).to render_template(:index)
  end

  it '/ page body should include given text' do
    get '/users/:id/posts'
    expect(response.body).to include("Here is a list of posts for agiven user")
  end

  it '/:id response status should be ok' do
    get '/users/:id/posts/:id'
    expect(response).to have_http_status(:ok)
  end

  it '/:id should render show' do
    get '/users/:id/posts/:id'
    expect(response).to render_template(:show)
  end

  it '/:id page body should include given text' do
    get '/users/:id/posts/:id'
    expect(response.body).to include("Here is a single post of a given user")
  end
end
