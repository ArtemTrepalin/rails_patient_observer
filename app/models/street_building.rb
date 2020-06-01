class StreetBuilding < ApplicationRecord
  belongs_to :street
  belongs_to :building
end
