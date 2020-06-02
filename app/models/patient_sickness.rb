class PatientSickness < ApplicationRecord
  belongs_to :patient
  belongs_to :sickness
end
