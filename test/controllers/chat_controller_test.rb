require 'test_helper'

class ChatControllerTest < ActionController::TestCase
  test "should get send" do
    get :send
    assert_response :success
  end

  test "should get get" do
    get :get
    assert_response :success
  end

end
