class Patient < ApplicationRecord
  belongs_to :watcher
  has_many :history, dependent: :nullify
  has_many :checklist, dependent: :destroy
  has_many :contact, dependent: :destroy
  has_many :help_address, dependent: :destroy

  has_secure_password validations: false
  validates :first_name, :last_name, :birthday, :password, presence: true
end
