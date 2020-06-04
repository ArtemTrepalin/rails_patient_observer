require 'test_helper'

class Web::Admin::StreetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @street = create :street
  end

  test 'should get index page' do
    get admin_streets_path
    assert_response :success
  end

  test 'should get new streetes page' do
    get new_admin_street_path
    assert_response :success
  end

  test 'should post create street' do
    streetes_attrs = attributes_for :street
    post admin_streets_path, params: { street: streetes_attrs }
    assert_response :redirect
    street = Street.last
    assert_equal streetes_attrs[:name], street.name
  end

  test 'should get show street page' do
    get admin_street_path(@street)
    assert_response :success
  end

  test 'should get edit street page' do
    get edit_admin_street_path(@street)
    assert_response :success
  end

  test 'should update street' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_street_path(@street), params: { street: attrs }
    assert_response :redirect
    @street.reload
    assert_equal attrs[:name], @street.name
  end

  test 'should destroy street' do
    street = create :street
    delete admin_street_path(street.id)
    assert_response :redirect
    assert_not Street.exists?(street.id)
  end
end
