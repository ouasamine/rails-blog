class Comment < ApplicationRecord
  belongs_to :post

  def update_comments_counter(post)
    q_post = Post.find_by(post:)
    q_post.comments_counter += 1
    q_post.save
  end
end
