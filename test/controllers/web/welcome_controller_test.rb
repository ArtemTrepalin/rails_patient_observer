require 'test_helper'

class Web::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get welcome page' do
    get new_admin_session_path
    assert_response :success
  end
end
