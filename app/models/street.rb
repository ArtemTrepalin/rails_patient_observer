class Street < ApplicationRecord
  has_many :buildings, through: :street_buildings

  validates :name, presence: true, uniqueness: true
end
