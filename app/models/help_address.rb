class HelpAddress < ApplicationRecord
  belongs_to :patient

  validates :name, :location, presence: true
end
