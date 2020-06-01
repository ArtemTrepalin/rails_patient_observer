class Admin < ApplicationRecord
  extend Enumerize

  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :email, uniqueness: true, email: true

  has_secure_password validations: false

  state_machine initial: :active do
    state :active
    state :deleted

    event :del do
      transition from: :active, to: :deleted, if: :active?
    end

    event :activate do
      transition from: :deleted, to: :active, if: :deleted?
    end
  end
end
