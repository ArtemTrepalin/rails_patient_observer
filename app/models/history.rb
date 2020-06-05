class History < ApplicationRecord
  belongs_to :status
  belongs_to :patient
  belongs_to :watcher
end
