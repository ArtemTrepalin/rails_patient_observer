require 'test_helper'

class Web::Admin::PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @patient = create :patient
  end
  test 'should get index patients page' do
    get admin_patients_path
    assert_response :success
  end

  test 'should get new patient page' do
    get new_admin_patient_path
    assert_response :success
  end

  test 'should create patient' do
    watcher = create :watcher
    patient_attrs = attributes_for :patient
    patient_attrs[:watcher_id] = watcher.id
    post admin_patients_path, params: { patient: patient_attrs }
    assert_response :redirect

    patient = Patient.last
    assert_equal patient_attrs[:last_name], patient.last_name
    assert_equal patient.watcher, watcher
  end

  test 'should not create patient' do
    patient_attrs = attributes_for :patient, last_name: nil

    post admin_patients_path, params: { patient: patient_attrs }
    assert_response :success

    patient = Patient.find_by(last_name: patient_attrs[:last_name])
    assert_nil patient
  end

  test 'should get show patient page' do
    get admin_patient_path(@patient)
    assert_response :success
  end

  test 'should get edit patient page' do
    get edit_admin_patient_path(@patient.id)
    assert_response :success
  end

  test 'should put update patient' do
    attrs = {}
    attrs[:first_name] = generate :first_name
    put admin_patient_path(@patient.id), params: { patient: attrs }
    assert_response :redirect

    @patient.reload
    assert_equal attrs[:first_name], @patient.first_name
  end
end
