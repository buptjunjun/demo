require 'test_helper'

class ControllerControllerTest < ActionController::TestCase
  test "should get demo2" do
    get :demo2
    assert_response :success
  end

end
