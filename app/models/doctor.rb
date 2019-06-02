class Doctor < ActiveRecord::Base
    has_many :records
    has_many :patients, through: :records
end
