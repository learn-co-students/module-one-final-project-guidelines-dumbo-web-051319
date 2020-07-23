class Diary < ActiveRecord::Base
  belongs_to :user
  belongs_to :fortune
end
