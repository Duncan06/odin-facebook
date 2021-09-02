ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Add red and green reporting
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  require 'rails/test_help'
  require "minitest/reporters"
  Minitest::Reporters.use!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers 

  def log_in( user )
    if integration_test?
      # Use warden helper
      login_as(user, :scope => :user)
    # Constroller_test, model_test
    else
      # Use devise helper
      sign_in(user)
    end
  end
end
