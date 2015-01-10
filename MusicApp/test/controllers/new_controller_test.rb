require 'test_helper'

class NewControllerTest < ActionController::TestCase
  test "should get Albums" do
    get :Albums
    assert_response :success
  end

end
