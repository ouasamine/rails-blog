require 'rails_helper'

RSpec.describe 'users handling', type: :request do
  it '/ should render index' do
    get '/users'
    expect(response).to render_template(:index)
  end
  it '/:id should render show' do
    get '/users/:id'
    expect(response).to render_template(:show)
  end
end
