require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should be valid' do
    post = Post.create(title: nil)
    expect(post).to_not be_valid
  end

  it 'update_posts_counter should increment posts_counter' do
    user = User.create(name: 'Amine', posts_counter: 0)
    post = Post.create(author: user, title: 'First post on the blog', comments_counter: 0, likes_counter: 0)
    comment = Comment.create(post: post,text: 'Welcome!')
    expect(user.posts_counter).to eql(1)
  end

  it 'latest_comments should return last comments' do
    user = User.create(name: 'Amine', posts_counter: 0)
    post = Post.create(title: 'First post on the blog', author: user, comments_counter: 0, likes_counter: 0)
    first_comment = Comment.create(post: post, author: user, text: 'Welcome!')
    second_comment = Comment.create(post: post,author: user, text: 'Hello!')
    expect(post.latest_comments).to include(first_comment)
  end
end