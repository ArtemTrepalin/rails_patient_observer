require 'test_helper'

class Web::Admin::ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @contact = create :contact
  end
  test 'should get index contacts page' do
    get admin_contacts_path
    assert_response :success
  end

  test 'should get new contact page' do
    get new_admin_contact_path
    assert_response :success
  end

  test 'should create contact' do
    patient = create :patient
    contact_attrs = attributes_for :contact
    contact_attrs[:patient_id] = patient.id
    post admin_contacts_path, params: { contact: contact_attrs }
    assert_response :redirect

    contact = Contact.last
    assert_equal contact_attrs[:name], contact.name
    assert_equal contact.patient, patient
  end

  test 'should not create contact' do
    contact_attrs = attributes_for :contact, name: nil

    post admin_contacts_path, params: { contact: contact_attrs }
    assert_response :success

    contact = Contact.find_by(name: contact_attrs[:name])
    assert_nil contact
  end

  test 'should get show contact page' do
    get admin_contact_path(@contact)
    assert_response :success
  end

  test 'should get edit contact page' do
    get edit_admin_contact_path(@contact.id)
    assert_response :success
  end

  test 'should put update contact' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_contact_path(@contact.id), params: { contact: attrs }
    assert_response :redirect

    @contact.reload
    assert_equal attrs[:name], @contact.name
  end
end
