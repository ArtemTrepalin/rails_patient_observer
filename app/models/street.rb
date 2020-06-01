class Street < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
