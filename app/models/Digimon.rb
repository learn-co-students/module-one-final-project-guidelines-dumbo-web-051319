class Digimon < ActiveRecord::Base
  has_many :digicards
  has_many :users, through: :digicards
  belongs_to :location
end
