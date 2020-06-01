require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  test 'should create building' do
    building = build :building
    building.save

    created_building = Building.last
    assert created_building
  end

  test 'should not create building without position' do
    building = build :building, position: nil
    building.save

    created_building = Building.last
    assert_nil created_building
  end

  test 'name should be unique' do
    first_building = build :building, position: 'repeat'
    first_building.save
    second_building = build :building, position: 'repeat'
    assert_not second_building.save
  end
end
