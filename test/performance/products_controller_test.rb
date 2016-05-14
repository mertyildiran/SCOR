require 'test_helper'
require 'rails/performance_test_help'
include Warden::Test::Helpers

class ProductsControllerTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  setup do
    @product = products(:one)
  end

  test "creating new product" do
    login_as(users(:admin))
    image = fixture_file_upload "#{Rails.root}/public/assets/products/1/original/" + @product.photo_file_name
    image.content_type = @product.photo_content_type
    post '/products', product: { category_id: @product.category, description: @product.description, photo: image, price: @product.price, title: @product.title }
  end

  test "updating a product" do
    login_as(users(:admin))
    patch '/products/' + @product.id.to_s, product: { category_id: @product.category, description: @product.description, price: @product.price, title: @product.title }
  end

  test "destroying a product" do
    login_as(users(:admin))
    delete '/products/' + @product.id.to_s
  end

end
