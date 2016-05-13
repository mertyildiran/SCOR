require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "login and browse the products" do
    # login via https
    https!
    get "/users/sign_in"
    assert_response :success

    post_via_redirect "/users/sign_in", username: users(:standard).email, password: users(:standard).encrypted_password
    assert_equal '/', path
    assert_equal 'Signed in successfully.', flash[:notice]

    https!(false)
    get "/products"
    assert_response :success
    assert assigns(:products)
  end

  test "login and browse the admin panel" do
    # login via https
    https!
    get "/users/sign_in"
    assert_response :success

    post_via_redirect "/users/sign_in", username: users(:admin).email, password: users(:admin).encrypted_password
    assert_equal '/', path
    assert_equal 'Signed in successfully.', flash[:notice]

    https!(false)
    get "/admin"
    assert_response :success
  end

end
