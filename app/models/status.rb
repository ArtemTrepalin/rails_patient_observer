class Status < ApplicationRecord
  has_many :history, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
