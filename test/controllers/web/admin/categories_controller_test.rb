require 'test_helper'

class Web::Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @category = create :category
  end
  test 'should get index categories page' do
    get admin_categories_path
    assert_response :success
  end

  test 'should get new category page' do
    get new_admin_category_path
    assert_response :success
  end

  test 'should create category' do
    category_attrs = attributes_for :category
    post admin_categories_path, params: { category: category_attrs }
    assert_response :redirect

    category = Category.last
    assert_equal category_attrs[:name], category.name
  end

  test 'should not create category' do
    category_attrs = attributes_for :category, name: nil

    post admin_categories_path, params: { category: category_attrs }
    assert_response :success

    category = Category.find_by(name: category_attrs[:name])
    assert_nil category
  end

  test 'should get show category page' do
    get admin_category_path(@category)
    assert_response :success
  end

  test 'should get edit category page' do
    get edit_admin_category_path(@category.id)
    assert_response :success
  end

  test 'should put update category' do
    attrs = {}
    attrs[:name] = generate :name
    put admin_category_path(@category.id), params: { category: attrs }
    assert_response :redirect

    @category.reload
    assert_equal attrs[:name], @category.name
  end
end
