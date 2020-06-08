class Patient < ApplicationRecord
  belongs_to :status
  belongs_to :watcher
  has_many :sickness, through: :patient_sickness
  has_many :history, dependent: :nullify
  has_many :checklist, dependent: :destroy
  has_many :contact, dependent: :destroy

  validates :first_name, :last_name, :address, :phone_number, presence: true
end
