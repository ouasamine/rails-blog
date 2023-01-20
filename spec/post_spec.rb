require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should be valid' do
    post = Post.create(title: nil)
    expect(post).to_not be_valid
  end
end