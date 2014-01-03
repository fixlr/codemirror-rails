# coding: utf-8
lib = File.expand_path '../lib', __FILE__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib
require 'codemirror/rails/version'

Gem::Specification.new do |s|
  s.name = 'codemirror-rails'
  s.version = Codemirror::Rails::VERSION
  s.authors = ['Nathan Fixler']
  s.email = 'nathan@fixler.org'
  s.license = 'MIT'
  s.summary = 'Use CodeMirror with Rails 3'
  s.description = 'This gem provides CodeMirror assets for your Rails 3 application.'
  s.homepage = 'https://rubygems.org/gems/codemirror-rails'

  s.files = `git ls-files`.split $/
  s.executables = spec.files.grep(%r{^bin/}) { |f| File.basename f }
  s.test_files = spec.files.grep(%r{^(test|spec|features)/})
  s.require_paths = %w(lib)

  s.add_runtime_dependency 'railties', '>= 3.0', '< 5'

  s.add_development_dependency 'rails', '~> 3.0'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'capybara'
end
