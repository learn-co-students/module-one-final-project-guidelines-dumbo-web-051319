class Post < ActiveRecord::Base
  has_many :likes
  has_many :accounts, through: :likes
  belongs_to :account
end
