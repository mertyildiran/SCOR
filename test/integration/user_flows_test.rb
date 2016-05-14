require 'test_helper'
include Warden::Test::Helpers

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "login and browse the products" do
    # login via https
    https!
    get "/users/sign_in"
    assert_response :success

    login_as(users(:standard))

    https!(false)
    get "/products"
    assert_response :success
    assert assigns(:products)
    Warden.test_reset!
  end

  test "login and browse the admin panel" do
    # login via https
    https!
    get "/users/sign_in"
    assert_response :success

    login_as(users(:admin))

    https!(false)
    get "/admin"
    assert_response :success
    Warden.test_reset!
  end

end
