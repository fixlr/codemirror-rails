require 'test_helper'

describe 'codemiror-rails integration' do
  it 'provides codemirror.js on the asset pipeline' do
    asset_file('codemirror.js').must_include 'function CodeMirror'
  end

  it 'provides codemirror css on the asset pipeline' do
    asset_file('codemirror.css').must_include '.CodeMirror'
  end

  def asset_file(name)
    Dummy::Application.assets[name].to_s
  end
end
