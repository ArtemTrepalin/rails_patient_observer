require 'test_helper'

class SicknessTest < ActiveSupport::TestCase
  test 'should create sickness' do
    sickness = build :sickness
    sickness.save

    created_sickness = Sickness.last
    assert created_sickness
  end

  test 'should not create sickness without name' do
    sickness = build :sickness, name: nil
    sickness.save

    created_sickness = Sickness.last
    assert_nil created_sickness
  end

  test 'name should be unique' do
    first_sickness = build :sickness, name: 'repeat'
    first_sickness.save
    second_sickness = build :sickness, name: 'repeat'
    assert_not second_sickness.save
  end
end
