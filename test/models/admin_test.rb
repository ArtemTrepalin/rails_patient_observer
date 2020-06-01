require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test 'should create admin' do
    admin = build :admin
    admin.save

    created_admin = Admin.last
    assert created_admin
  end

  test 'should not create admin without email' do
    admin = build :admin, email: nil
    admin.save

    created_admin = Admin.last
    assert_nil created_admin
  end

  test 'email should be unique' do
    first_admin = build :admin, email: 'test@gmail.com'
    first_admin.save
    second_admin = build :admin, email: 'test@gmail.com'
    assert_not second_admin.save
  end
end
