class User < ActiveRecord::Base
  has_many :digicards
  has_many :digimons, through: :digicards
end
