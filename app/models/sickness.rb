class Sickness < ApplicationRecord
  has_many :patients, through: :patient_sickness
  validates :name, presence: true, uniqueness: true
end
