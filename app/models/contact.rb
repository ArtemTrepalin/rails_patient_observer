class Contact < ApplicationRecord
  belongs_to :patient

  validates :name, :phone_number, presence: true
end
