require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get drop" do
    get :drop
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
