require 'test_helper'

class StatpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get test" do
    get :test
    assert_response :success
  end


end
