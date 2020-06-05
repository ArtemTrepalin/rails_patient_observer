class Status < ApplicationRecord
  has_many :patient, dependent: :nullify
  has_many :history, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
