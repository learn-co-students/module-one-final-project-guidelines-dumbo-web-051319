class Spell < ActiveRecord::Base
  has_many :character_spells
  has_many :characters, through: :character_spells
end
