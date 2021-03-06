ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Set up ActionDispatch tests.
class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def login(user)
    sign_in_as(user, "1234567890")
  end

  def sign_in_as(user, password)
    user.update password: password, password_confirmation: password
    post new_user_session_url, params: {
      user: { email: user.email, password: password }
    }
    follow_redirect!
    user
  end
end
