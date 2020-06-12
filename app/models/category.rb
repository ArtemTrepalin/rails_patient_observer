class Category < ApplicationRecord
  has_many :useful_videos, dependent: :destroy
  has_many :useful_texts, dependent: :destroy

  validates :name, :image_link, presence: true
end
