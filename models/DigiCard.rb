class Digicard < ActiveRecord::Base
  belongs_to :users
  belongs_to :digimons
end
