class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: "User"

  def update_comments_counter
    Post.find(post.id).increment(:comments_counter)
  end
end
