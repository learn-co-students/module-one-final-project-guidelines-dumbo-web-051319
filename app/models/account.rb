class Account < ActiveRecord::Base
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :liked_posts, through: :likes, class_name: 'Post'
end
