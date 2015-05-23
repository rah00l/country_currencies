require 'simplecov'
require 'simplecov-json'
# SimpleCov.start

# SimpleCov report will only be generated when tests are executed like :
# COVERAGE=true rake test
SimpleCov.start 'rails' do

  SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter,
                          SimpleCov::Formatter::JSONFormatter ]
end if ENV["COVERAGE"]

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require 'action_view/test_case'
# Minitest-Spec-Rails should not be required until after ActionView::TestCase
require 'minitest-spec-rails'

require 'test_help'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def self.should_not_respond_to_actions(actions = {})
    actions.each do |name, method|
      test "should not respond to #{method.to_s.upcase} :#{name}" do
        assert_raise ActionController::RoutingError do
          send(method, name)
        end
      end
    end
  end

  def self.test_validates_presence_of(*attributes)
    attributes.each do |attribute|
      test "validates_presence_of #{attribute}" do
        object = testing_class.new(attribute => nil)
        assert object.invalid?
        assert object.errors[attribute].include?("can't be blank")
      end
    end
  end

  def testing_class
    begin
      self.class.to_s[0..-5].constantize
    rescue NameError
      nil
    end
  end
end
