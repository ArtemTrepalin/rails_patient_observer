require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test 'should create status' do
    status = build :status
    status.save

    created_status = Status.last
    assert created_status
  end

  test 'should not create status without name' do
    status = build :status, name: nil
    status.save

    created_status = Status.last
    assert_nil created_status
  end

  test 'name should be unique' do
    first_status = build :status, name: 'repeat'
    first_status.save
    second_status = build :status, name: 'repeat'
    assert_not second_status.save
  end
end
