ENV['RAILS_ENV'] = 'test'

require 'rails/version'
case "#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"
when '3.2'
  require File.expand_path('../dummy-3.2.x/config/environment', __FILE__)
when '4.0'
  require File.expand_path('../dummy-4.0.x/config/environment', __FILE__)
when '4.1'
  require File.expand_path('../dummy-4.1.x/config/environment', __FILE__)
when '5.0'
  require File.expand_path('../dummy-5.0.x/config/environment', __FILE__)
end

require 'rails/test_help'
require 'minitest/autorun'

Rails.backtrace_cleaner.remove_silencers!
