class Building < ApplicationRecord
  validates :position, presence: true, uniqueness: true
end
