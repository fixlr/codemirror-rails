ENV['RAILS_ENV'] = 'test'

require 'rails/version'
dummy_path = File.expand_path(
  "dummy-#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}.x",
  __dir__
)

if File.exist?(dummy_path)
  require File.join(dummy_path, 'config', 'environment')
else
  puts <<-EOS

  You must generate a dummy application for this version of Rails before you
  can run the codemirror-rails test suite.

  EOS
  exit 1
end

require 'rails/test_help'
require 'minitest/autorun'

Rails.backtrace_cleaner.remove_silencers!
