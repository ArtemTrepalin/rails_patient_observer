class Patient < ApplicationRecord
  belongs_to :watcher
  has_many :history, dependent: :nullify
  has_many :checklist, dependent: :destroy
  has_many :contact, dependent: :destroy
  has_many :address, dependent: :destroy

  validates :first_name, :last_name, :birthday, presence: true
end
