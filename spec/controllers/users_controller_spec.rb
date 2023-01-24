require 'rails_helper'

RSpec.describe 'users handling', type: :request do
  it '/ response status should be ok' do
    get '/users'
    expect(response).to have_http_status(:ok)
  end

  it '/ should render index' do
    get '/users'
    expect(response).to render_template(:index)
  end

  it '/ page body should include given text' do
    get '/users'
    expect(response.body).to include('Here is a list of users')
  end

  it '/:id response status should be ok' do
    get '/users/:id'
    expect(response).to have_http_status(:ok)
  end

  it '/:id should render show' do
    get '/users/:id'
    expect(response).to render_template(:show)
  end

  it '/:id page body should include given text' do
    get '/users/:id'
    expect(response.body).to include('Here is details of a given user')
  end
end
