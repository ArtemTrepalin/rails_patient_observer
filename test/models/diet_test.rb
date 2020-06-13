require 'test_helper'

class DietTest < ActiveSupport::TestCase
  test 'should create diet' do
    diet = build :diet
    diet.save

    created_diet = Diet.last
    assert created_diet
  end

  test 'should not create diet without description' do
    diet = build :diet, description: nil
    diet.save

    created_diet = Diet.last
    assert_nil created_diet
  end
end
