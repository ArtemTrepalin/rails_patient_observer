require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should create category' do
    category = build :category
    category.save

    created_history = Category.last
    assert created_history
  end

  test 'should not create category without image_link' do
    category = build :category, image_link: nil
    category.save

    created_history = Category.last
    assert_nil created_history
  end
end
