class Digimon < ActiveRecord::Base
  has_many :bagcards
  has_many :trainers, through: :bagcards
end
