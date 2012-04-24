ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'capybara/rails'

Rails.backtrace_cleaner.remove_silencers!

class IntegrationTest < MiniTest::Spec
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end
