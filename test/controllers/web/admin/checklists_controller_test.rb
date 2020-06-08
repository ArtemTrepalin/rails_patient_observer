require 'test_helper'

class Web::Admin::ChecklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @checklist = create :checklist
  end
  test 'should get index checklists page' do
    get admin_checklists_path
    assert_response :success
  end

  test 'should get new checklist page' do
    get new_admin_checklist_path
    assert_response :success
  end

  test 'should create checklist' do
    patient = create :patient
    checklist_attrs = attributes_for :checklist
    checklist_attrs[:patient_id] = patient.id
    post admin_checklists_path, params: { checklist: checklist_attrs }
    assert_response :redirect

    checklist = Checklist.last
    assert_equal checklist_attrs[:name], checklist.name
    assert_equal checklist.patient, patient
  end

  test 'should not create checklist' do
    checklist_attrs = attributes_for :checklist, name: nil

    post admin_checklists_path, params: { checklist: checklist_attrs }
    assert_response :success

    checklist = Checklist.find_by(name: checklist_attrs[:name])
    assert_nil checklist
  end

  test 'should get show checklist page' do
    get admin_checklist_path(@checklist)
    assert_response :success
  end

  test 'should get edit checklist page' do
    get edit_admin_checklist_path(@checklist.id)
    assert_response :success
  end

  test 'should put update checklist' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_checklist_path(@checklist.id), params: { checklist: attrs }
    assert_response :redirect

    @checklist.reload
    assert_equal attrs[:name], @checklist.name
  end
end
