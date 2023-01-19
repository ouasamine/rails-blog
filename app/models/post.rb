class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  def update_posts_counter(user)
    q_user = User.find_by(name: user)
    q_user.posts_counter + +
    q_user.save
  end

  def latest_comments
    Comment.find_by(post: self)
  end
end
