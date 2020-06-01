require 'test_helper'

class StreetTest < ActiveSupport::TestCase
  test 'should create street' do
    street = build :street
    street.save

    created_street = Street.last
    assert created_street
  end

  test 'should not create street without name' do
    street = build :street, name: nil
    street.save

    created_street = Street.last
    assert_nil created_street
  end

  test 'name should be unique' do
    first_street = build :street, name: 'repeat'
    first_street.save
    second_street = build :street, name: 'repeat'
    assert_not second_street.save
  end
end
