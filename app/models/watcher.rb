class Watcher < ApplicationRecord
  has_many :patients, dependent: :nullify

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :email, uniqueness: true, email: true

  has_secure_password validations: false
end
