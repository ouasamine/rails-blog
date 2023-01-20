require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid' do
    user = User.create(name: nil)
    expect(user).to_not be_valid
  end

  it 'latest_posts should return last posts' do
    user = User.create(name: 'Amine', posts_counter: 0)
    first_post = Post.create(author: user, title: 'First post on the blog', comments_counter: 0, likes_counter: 0)
    expect(user.latest_posts).to include(first_post)
  end
end
