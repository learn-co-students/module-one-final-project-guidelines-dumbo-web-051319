class Digicard < ActiveRecord::Base
  belongs_to :user
  belongs_to :digimon
end
