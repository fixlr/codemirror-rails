#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test

class CodeMirror
  attr_reader :version

  TMP = Pathname.new('./tmp')
  TMP.mkpath unless TMP.exist?

  def initialize(version)
    @version = version
  end

  def filename
    "codemirror-#{version}"
  end

  def url
    "http://codemirror.net/#{archive}"
  end

  def archive
    "#{filename}.zip"
  end

  def tmp
    TMP.join(archive)
  end

  def output
    TMP
  end

  def unpacked
    TMP.join(filename)
  end

  def cleanup!
    tmp.delete if tmp.exist?
    unpacked.rmtree if unpacked.exist?

    javascripts.rmtree if javascripts.exist?
    javascripts.mkpath

    stylesheets.rmtree if stylesheets.exist?
    stylesheets.mkpath
  end

  def unpack!
    system('unzip', tmp.to_s, '-d', output.to_s)
  end

  def assets
    Pathname.new('vendor/assets')
  end

  def javascripts
    assets.join('javascripts', 'codemirror')
  end

  def stylesheets
    assets.join('stylesheets', 'codemirror')
  end

  def join(*args)
    unpacked.join(*args)
  end

  def move_javascripts!
    join('lib', 'codemirror.js').rename(assets.join('javascripts', 'codemirror.js'))
    join('keymap').rename(javascripts.join('keymaps'))

    modes = javascripts.join('modes')
    modes.mkpath

    Pathname.glob(join('mode').join('**/*.js')).each do |mode|
      next unless mode.basename('.js') == mode.dirname.basename

      file = mode.dirname.relative_path_from(join('mode')).to_s.sub('/', '-') + '.js'
      mode.rename(modes.join(file))
    end

    utils = javascripts.join('utils')
    utils.mkpath

    Pathname.glob(join('addon').join('**/*.js')).each do |addon|
      next if addon.basename.to_s =~ /\.node\./
      addon.rename(utils.join(addon.basename))
    end
  end

  def move_stylesheets!
    join('lib', 'codemirror.css').rename(assets.join('stylesheets', 'codemirror.css'))

    join('theme').rename(stylesheets.join('themes'))

    modes = stylesheets.join('modes')
    modes.mkpath

    Pathname.glob(join('mode').join('**/*.css')).each do |mode|
      next unless mode.basename('.css') == mode.dirname.basename

      file = mode.dirname.relative_path_from(join('mode')).to_s.sub('/', '-') + '.css'
      mode.rename(modes.join(file))
    end

    utils = stylesheets.join('utils')
    utils.mkpath

    Pathname.glob(join('addon').join('**/*.css')).each do |addon|
      addon.rename(utils.join(addon.basename))
    end
  end

  def move_to_vendor!
    move_javascripts!
    move_stylesheets!
  end
end

namespace :codemirror do
  task :fetch, :version do |task, args|
    require 'open-uri'

    cm = CodeMirror.new(args[:version])

    cm.cleanup!

    open(cm.tmp, 'wb') do |file|
      file.print open(cm.url).read
    end

    cm.unpack!
    cm.move_to_vendor!
  end
end
