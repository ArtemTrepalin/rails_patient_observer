require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test 'should create contact' do
    contact = build :contact
    contact.save

    created_contact = Contact.last
    assert created_contact
  end

  test 'should not create contact without name' do
    contact = build :contact, name: nil
    contact.save

    created_contact = Contact.last
    assert_nil created_contact
  end
end
