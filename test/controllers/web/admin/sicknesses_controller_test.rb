require 'test_helper'

class Web::Admin::SicknessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @sickness = create :sickness
  end

  test 'should get index page' do
    get admin_sicknesses_path
    assert_response :success
  end

  test 'should get new sicknesses page' do
    get new_admin_sickness_path
    assert_response :success
  end

  test 'should post create sickness' do
    sicknesses_attrs = attributes_for :sickness
    post admin_sicknesses_path, params: { sickness: sicknesses_attrs }
    assert_response :redirect
    sickness = Sickness.last
    assert_equal sicknesses_attrs[:name], sickness.name
  end

  test 'should get show sickness page' do
    get admin_sickness_path(@sickness)
    assert_response :success
  end

  test 'should get edit sickness page' do
    get edit_admin_sickness_path(@sickness)
    assert_response :success
  end

  test 'should update sickness' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_sickness_path(@sickness), params: { sickness: attrs }
    assert_response :redirect
    @sickness.reload
    assert_equal attrs[:name], @sickness.name
  end

  test 'should destroy sickness' do
    sickness = create :sickness
    delete admin_sickness_path(sickness.id)
    assert_response :redirect
    assert_not Sickness.exists?(sickness.id)
  end
end
