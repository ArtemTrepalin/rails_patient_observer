require 'test_helper'

class Web::Admin::StatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @status = create :status
  end

  test 'should get index page' do
    get admin_statuses_path
    assert_response :success
  end

  test 'should get new statuses page' do
    get new_admin_status_path
    assert_response :success
  end

  test 'should post create status' do
    statuses_attrs = attributes_for :status
    post admin_statuses_path, params: { status: statuses_attrs }
    assert_response :redirect
    status = Status.last
    assert_equal statuses_attrs[:name], status.name
  end

  test 'should get show status page' do
    get admin_status_path(@status)
    assert_response :success
  end

  test 'should get edit status page' do
    get edit_admin_status_path(@status)
    assert_response :success
  end

  test 'should update status' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_status_path(@status), params: { status: attrs }
    assert_response :redirect
    @status.reload
    assert_equal attrs[:name], @status.name
  end

  test 'should destroy status' do
    status = create :status
    delete admin_status_path(status.id)
    assert_response :redirect
    assert_not Status.exists?(status.id)
  end
end
