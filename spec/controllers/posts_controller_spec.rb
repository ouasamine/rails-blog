require 'rails_helper'

RSpec.describe 'posts handling', type: :request do 
  it '/ should render index' do 
    get '/users/:id/posts'
    expect(response).to render_template(:index)
  end
  it '/:id should render show' do 
    get '/users/:id/posts/:id'
    expect(response).to render_template(:show)
  end
end
