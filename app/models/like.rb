class Like < ApplicationRecord
  belongs_to :post

  def update_likes_counter(post)
    q_post = Post.find_by(post:)
    q_post.likes_counter + +
    q_post.save
  end
end
