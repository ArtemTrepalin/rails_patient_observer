class Status < ApplicationRecord
  has_many :patient, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
