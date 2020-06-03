require 'test_helper'

class Web::Admin::WatchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @watcher = create :watcher
  end
  test 'should get index watchers page' do
    get admin_watchers_path
    assert_response :success
  end

  test 'should get new watcher page' do
    get new_admin_watcher_path
    assert_response :success
  end

  test 'should create watcher' do
    watcher_attrs = attributes_for :watcher
    post admin_watchers_path, params: { watcher: watcher_attrs }
    assert_response :redirect

    watcher = Watcher.last
    assert_equal watcher_attrs[:email], watcher.email
  end

  test 'should not create watcher' do
    watcher_attrs = attributes_for :watcher, email: nil

    post admin_watchers_path, params: { watcher: watcher_attrs }
    assert_response :success

    watcher = Watcher.find_by(email: watcher_attrs[:email])
    assert_nil watcher
  end

  test 'should get show watcher page' do
    get admin_watcher_path(@watcher)
    assert_response :success
  end

  test 'should get edit watcher page' do
    get edit_admin_watcher_path(@watcher.id)
    assert_response :success
  end

  test 'should put update watcher' do
    attrs = {}
    attrs[:first_name] = generate :first_name
    put admin_watcher_path(@watcher.id), params: { watcher: attrs }
    assert_response :redirect

    @watcher.reload
    assert_equal attrs[:first_name], @watcher.first_name
  end
end
