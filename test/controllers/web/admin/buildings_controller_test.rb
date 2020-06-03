require 'test_helper'

class Web::Admin::BuildingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @building = create :building
  end

  test 'should get index page' do
    get admin_buildings_path
    assert_response :success
  end

  test 'should get new buildinges page' do
    get new_admin_building_path
    assert_response :success
  end

  test 'should post create building' do
    buildinges_attrs = attributes_for :building
    post admin_buildings_path, params: { building: buildinges_attrs }
    assert_response :redirect
    building = Building.last
    assert_equal buildinges_attrs[:position], building.position
  end

  test 'should get show building page' do
    get admin_building_path(@building)
    assert_response :success
  end

  test 'should get edit building page' do
    get edit_admin_building_path(@building)
    assert_response :success
  end

  test 'should update building' do
    attrs = {}
    attrs[:position] = generate :position
    put admin_building_path(@building), params: { building: attrs }
    assert_response :redirect
    @building.reload
    assert_equal attrs[:position], @building.position
  end

  test 'should destroy building' do
    building = create :building
    delete admin_building_path(building.id)
    assert_response :redirect
    assert_not Building.exists?(building.id)
  end
end
