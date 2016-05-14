require 'test_helper'
include Devise::TestHelpers

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @category = categories(:one)
    post :create, category: { desc: @category.desc, name: @category.name }
    #@category = Category.new({:name => "New T-Shirts", :desc => "Example category description"})
    #@product.category_id = @category.id
    #puts @category.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    sign_in users(:admin)
    get :new
    assert_response :success
  end

  test "should create product" do
    sign_in users(:admin)
    assert_difference('Product.count') do
      post :create, product: { category_id: @product.category, description: @product.description, photo_content_type: @product.photo_content_type, photo_file_name: @product.photo_file_name, photo_file_size: @product.photo_file_size, photo_updated_at: @product.photo_updated_at, price: @product.price, title: @product.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:admin)
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    sign_in users(:admin)
    patch :update, id: @product, product: { category_id: @product.category, description: @product.description, price: @product.price, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    sign_in users(:admin)
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
