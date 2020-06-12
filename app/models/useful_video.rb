class UsefulVideo < ApplicationRecord
  belongs_to :category

  validates :link, presence: true
end
