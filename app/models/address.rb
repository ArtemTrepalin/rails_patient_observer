class Address < ApplicationRecord
  belongs_to :patient

  validates :name, :location, presence: true
end
