class Patient < ApplicationRecord
  belongs_to :status
  belongs_to :street
  belongs_to :watcher
  has_many :sickness, through: :patient_sickness

  validates :first_name, :last_name, :phone_number, presence: true
end
