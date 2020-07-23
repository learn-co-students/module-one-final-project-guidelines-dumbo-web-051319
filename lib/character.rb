class Character < ActiveRecord::Base
  has_many :character_spells
  has_many :user_characters
  has_many :characters, through: :user_characters
  has_many :spells, through: :character_spells
end
