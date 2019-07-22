require File.expand_path('../lib/codemirror/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'codemirror-rails'
  s.version = Codemirror::Rails::VERSION
  s.authors = ['Nathan Fixler']
  s.email = 'nathan@fixler.org'
  s.license = 'MIT'
  s.summary = 'Use CodeMirror with Rails'
  s.description = 'This gem provides CodeMirror assets for your Rails application.'
  s.homepage = 'https://rubygems.org/gems/codemirror-rails'

  s.files = Dir.glob('{doc,lib,vendor}/**/*') + %w(LICENSE README.md)

  s.add_runtime_dependency 'railties', '>= 4.2', '< 6.1'

  s.add_development_dependency 'rails'
  s.add_development_dependency 'minitest'
end
