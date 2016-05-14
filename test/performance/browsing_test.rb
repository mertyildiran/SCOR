require 'test_helper'
require 'rails/performance_test_help'

class BrowsingTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }

  setup do
    #MyApp::Application.load_tasks
    #Rake::Task["db:seed"].invoke
    #load "#{Rails.root}/db/seeds.rb"
    #Rails.application.load_seed
  end

  test "page home" do
    get '/'
  end

  test "page about" do
    get '/page/about'
  end

  test "page faqs" do
    get '/page/faqs'
  end

  test "page contact" do
    get '/page/contact'
  end

  test "categories index" do
    get '/categories'
  end

  test "cart index" do
    get '/cart'
  end

  test "sign in page" do
    get '/users/sign_in'
  end

  test "sign up page" do
    get '/users/sign_up'
  end

end
