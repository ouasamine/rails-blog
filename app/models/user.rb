class User < ApplicationRecord
  has_many :posts, foreign_key: "author_id"

  def latest_posts
    Post.where(author: self).limit(3)
  end
end
