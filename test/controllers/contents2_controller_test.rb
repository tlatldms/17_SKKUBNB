require 'test_helper'

class Contents2ControllerTest < ActionController::TestCase
  test "should get edit2" do
    get :edit2
    assert_response :success
  end

  test "should get new2" do
    get :new2
    assert_response :success
  end

  test "should get show2" do
    get :show2
    assert_response :success
  end

end
