require 'test_helper'

describe 'codemiror-rails integration' do
  it 'provides codemirror.js on the asset pipeline' do
    visit '/assets/codemirror.js'
    page.text.must_include 'window.CodeMirror'
  end

  it 'provides codemirror css on the asset pipeline' do
    visit '/assets/codemirror.css'
    page.text.must_include '.CodeMirror'
  end
end
