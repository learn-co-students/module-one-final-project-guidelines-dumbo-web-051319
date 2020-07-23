class CharacterSpell < ActiveRecord::Base
  belongs_to :spell
  belongs_to :character
end
