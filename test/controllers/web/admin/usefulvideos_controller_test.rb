require 'test_helper'

class Web::Admin::UsefulvideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @usefulvideo = create :useful_video
  end
  test 'should get index usefulvideos page' do
    get admin_usefulvideos_path
    assert_response :success
  end

  test 'should get new usefulvideo page' do
    get new_admin_usefulvideo_path
    assert_response :success
  end

  test 'should create usefulvideo' do
    category = create :category
    usefulvideo_attrs = attributes_for :useful_video
    usefulvideo_attrs[:category_id] = category.id
    post admin_usefulvideos_path, params: { usefulvideo: usefulvideo_attrs }
    assert_response :redirect

    usefulvideo = UsefulVideo.last
    assert_equal usefulvideo_attrs[:link], usefulvideo.link
    assert_equal usefulvideo.category, category
  end

  test 'should not create usefulvideo' do
    usefulvideo_attrs = attributes_for :useful_video, link: nil

    post admin_usefulvideos_path, params: { usefulvideo: usefulvideo_attrs }
    assert_response :success

    usefulvideo = UsefulVideo.find_by(link: usefulvideo_attrs[:link])
    assert_nil usefulvideo
  end

  test 'should get show usefulvideo page' do
    get admin_usefulvideo_path(@usefulvideo)
    assert_response :success
  end

  test 'should get edit usefulvideo page' do
    get edit_admin_usefulvideo_path(@usefulvideo.id)
    assert_response :success
  end

  test 'should put update usefulvideo' do
    attrs = {}
    attrs[:link] = generate :link
    put admin_usefulvideo_path(@usefulvideo.id), params: { usefulvideo: attrs }
    assert_response :redirect

    @usefulvideo.reload
    assert_equal attrs[:link], @usefulvideo.link
  end
end
