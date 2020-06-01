require 'test_helper'

class Web::Admin::AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
  end
  test 'should get index admins page' do
    get admin_admins_path
    assert_response :success
  end

  test 'should get new admin page' do
    get new_admin_admin_path
    assert_response :success
  end

  test 'should post create admin' do
    admins_attrs = attributes_for :admin
    post admin_admins_path, params: { admin: admins_attrs }
    assert_response :redirect
    admin = Admin.last
    assert_equal admins_attrs[:email], admin.email
  end

  test 'should get show admin page' do
    get admin_admin_path(@admin)
    assert_response :success
  end

  test 'should get edit admin page' do
    get edit_admin_admin_path(@admin)
    assert_response :success
  end

  test 'should put update admin' do
    attrs = {}
    attrs[:email] = generate :email
    put admin_admin_path(@admin), params: { admin: attrs }
    assert_response :redirect
    @admin.reload
    assert_equal attrs[:email], @admin.email
  end
end
