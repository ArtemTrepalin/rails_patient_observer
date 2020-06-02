class Street < ApplicationRecord
  has_many :buildings, through: :street_buildings
  has_many :patient, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
