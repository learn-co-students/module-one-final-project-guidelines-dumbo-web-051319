class Patient < ActiveRecord::Base
    has_many :records
    has_many :doctors, through: :records
end
