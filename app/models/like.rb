class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_likes_counter
    Post.find(post.id).increment(:likes_counter)
  end
end
