require File.expand_path('../lib/codemirror/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'codemirror-rails'
  s.version = Codemirror::Rails::VERSION
  s.authors = ['Nathan Fixler']
  s.email = 'nathan@fixler.org'
  s.license = 'MIT'
  s.summary = 'Use CodeMirror with Rails 3'
  s.description = 'This gem provides CodeMirror assets for your Rails 3 application.'
  s.homepage = 'https://rubygems.org/gems/codemirror-rails'

  s.files = `git ls-files`.split("\n")

  s.add_runtime_dependency 'railties', '>= 3.0', '< 5'

  s.add_development_dependency 'rails', '~> 3.0'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'capybara'
end
