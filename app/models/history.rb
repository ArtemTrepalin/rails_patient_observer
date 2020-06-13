class History < ApplicationRecord
  belongs_to :status
  belongs_to :patient
end
