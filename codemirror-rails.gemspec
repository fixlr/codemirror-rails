require File.expand_path('../lib/codemirror-rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'codemirror-rails'
  s.version = Codemirror::Rails::VERSION
  s.authors = ['Nathan Fixler','David Spurr']
  s.email = 'nathan@fixler.org'
  s.summary = 'Use CodeMirror with Rails 3 asset pipeline'
  s.description = 'This gem provides CodeMirror assets for your Rails 3 application using the asset pipeline.'
  s.homepage = 'https://rubygems.org/gems/codemirror-rails'

  s.files = `git ls-files`.split("\n")
end
