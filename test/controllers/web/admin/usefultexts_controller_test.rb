require 'test_helper'

class Web::Admin::UsefultextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @usefultext = create :useful_text
  end
  test 'should get index usefultexts page' do
    get admin_usefultexts_path
    assert_response :success
  end

  test 'should get new usefultext page' do
    get new_admin_usefultext_path
    assert_response :success
  end

  test 'should create usefultext' do
    category = create :category
    usefultext_attrs = attributes_for :useful_text
    usefultext_attrs[:category_id] = category.id
    post admin_usefultexts_path, params: { usefultext: usefultext_attrs }
    assert_response :redirect

    usefultext = UsefulText.last
    assert_equal usefultext_attrs[:description], usefultext.description
    assert_equal usefultext.category, category
  end

  test 'should not create usefultext' do
    usefultext_attrs = attributes_for :useful_text, description: nil

    post admin_usefultexts_path, params: { usefultext: usefultext_attrs }
    assert_response :success

    usefultext = UsefulText.find_by(description: usefultext_attrs[:description])
    assert_nil usefultext
  end

  test 'should get show usefultext page' do
    get admin_usefultext_path(@usefultext)
    assert_response :success
  end

  test 'should get edit usefultext page' do
    get edit_admin_usefultext_path(@usefultext.id)
    assert_response :success
  end

  test 'should put update usefultext' do
    attrs = {}
    attrs[:description] = generate :description
    put admin_usefultext_path(@usefultext.id), params: { usefultext: attrs }
    assert_response :redirect

    @usefultext.reload
    assert_equal attrs[:description], @usefultext.description
  end
end
