require 'test_helper'
require 'rails/performance_test_help'
include Warden::Test::Helpers

class CategoriesControllerTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  setup do
    @category = categories(:one)
  end

  test "creating new category" do
    login_as(users(:admin))
    post '/categories', category: { desc: @category.desc, name: @category.name }
  end

  test "updating a category" do
    login_as(users(:admin))
    patch '/categories/' + @category.id.to_s, category: { desc: @category.desc, name: @category.name }
  end

  test "destroying a category" do
    login_as(users(:admin))
    delete '/categories/' + @category.id.to_s
  end

end
