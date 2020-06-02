require 'test_helper'

class PatientSicknessTest < ActiveSupport::TestCase
  test 'should be create patient_sickness with company and city' do
    patient_sickness = create :patient_sickness
    assert patient_sickness
  end
end
