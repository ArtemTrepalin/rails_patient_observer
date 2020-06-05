require 'test_helper'

class Web::Admin::HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @hitsory = create :history
  end

  test 'should get index histories page' do
    get admin_histories_path
    assert_response :success
  end

  test 'should get show history page' do
    get admin_histoty_path(@history)
    assert_response :success
  end
end
