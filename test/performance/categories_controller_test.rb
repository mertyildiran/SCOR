require 'test_helper'
require 'rails/performance_test_help'
include Devise::TestHelpers

class CategoriesControllerTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  setup do
    load "#{Rails.root}/db/test-seeds.rb"
    @category = categories(:one)
    sign_in User.first
  end

  test "creating new category" do
    #post :create, category: { desc: @category.desc, name: @category.name }
    post '/categories', :post => { :desc => @category.desc, :name => @category.name }
  end

end
