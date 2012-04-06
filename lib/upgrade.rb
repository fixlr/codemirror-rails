#! /usr/bin/env ruby
# Downloads and installs the js/css for the latest version of CodeMirror
# run from the project root -> lib/upgrade.rb
 
require 'fileutils'
require 'open-uri'

def copy(from,to,kind)
  root = "vendor/assets/#{kind}"
  dest = "#{root}/#{to}"
  FileUtils.mkdir_p root

  if to.match /\//
    puts "creating #{dest} directory"
    FileUtils.mkdir_p dest
  end

  Dir.glob("#{@version}/#{from}").each do |f|
    puts "  #{f} → #{dest}"

    namespace = f.gsub("#{@version}/","").split("/").compact
    if namespace.length > 3
      # this is a nested mode, prepend the mode name to the file
      filename = f.split("/").pop
      FileUtils.cp f, "#{dest+namespace[1]}-#{filename}"
    else
      FileUtils.cp f, dest
    end
  end
end

def css_copy(from, to)
  copy from, to, 'stylesheets'
end

def js_copy(from, to)
  copy from, to, 'javascripts'
end

# download current
FileUtils.rm_r 'tmp' if File.exists?('tmp')
Dir.mkdir 'tmp'

File.open('tmp/codemirror.zip', "w") {|f| f << open('http://codemirror.net/codemirror.zip').read }
`unzip tmp/codemirror.zip -d tmp`
FileUtils.rm 'tmp/codemirror.zip'
@version = Dir.glob("tmp/*")[0]
puts "vendorizing #{@version}"

# delete existing
FileUtils.rm_r Dir.glob("vendor/assets/*")

# copy
js_copy 'lib/codemirror.js', 'codemirror.js'
js_copy 'lib/util/*.js', 'codemirror/utils/'
js_copy 'mode/**/*.js', 'codemirror/modes/'
js_copy 'keymap/*.js', 'codemirror/keymaps/'

css_copy 'lib/codemirror.css', 'codemirror.css'
css_copy 'lib/util/*.css', 'codemirror/utils/'
css_copy 'mode/**/*.css', 'codemirror/modes/'
css_copy 'theme/*.css', 'codemirror/themes/'

# Cleanup
FileUtils.rm_r 'tmp'
