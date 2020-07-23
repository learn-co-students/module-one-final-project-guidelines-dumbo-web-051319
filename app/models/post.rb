class Post < ActiveRecord::Base
  has_many :likes
  has_many :comments
  has_many :accounts, through: :likes
  belongs_to :account
end
