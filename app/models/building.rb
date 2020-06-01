class Building < ApplicationRecord
  has_many :streets, through: :street_buildings
  validates :position, presence: true, uniqueness: true
end
