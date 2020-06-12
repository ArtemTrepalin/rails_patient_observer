class Category < ApplicationRecord
  has_many :usefulvideos, dependent: :destroy
  has_many :usefultexts, dependent: :destroy

  validates :name, :image_link, presence: true
end
