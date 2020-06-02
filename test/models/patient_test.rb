require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test 'should create patient' do
    patient = build :patient
    patient.save

    created_patient = Patient.last
    assert created_patient
  end

  test 'should not create patient without first_name' do
    patient = build :patient, first_name: nil
    patient.save

    created_patient = Patient.last
    assert_nil created_patient
  end
end
