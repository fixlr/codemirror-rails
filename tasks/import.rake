require 'fileutils'

desc 'Copy the files from a CodeMirror distribution to vendor/'
task :import do
  base = ENV['DIR']
  unless base && File.exist?(base)
    puts 'Could not find CodeMirror distribution directory'
    exit 1
  end

  FileUtils.rm_r 'vendor'
  FileUtils.mkdir_p 'vendor/assets/javascripts/codemirror'
  FileUtils.mkdir_p 'vendor/assets/stylesheets/codemirror'

  # Main file.
  FileUtils.cp File.join(base, 'lib', 'codemirror.js'),
               'vendor/assets/javascripts/'
  FileUtils.cp File.join(base, 'lib', 'codemirror.css'),
               'vendor/assets/stylesheets/'

  # Themes are CSS-only.
  FileUtils.mkdir_p 'vendor/assets/stylesheets/codemirror/themes'
  FileUtils.cp Dir.glob(File.join(base, 'theme', '*.css')),
               'vendor/assets/stylesheets/codemirror/themes'
  if File.exist? 'vendor/assets/stylesheets/codemirror/themes/index.css'
    raise 'codemirror/themes/index.css already exists'
  end
  File.open 'vendor/assets/stylesheets/codemirror/themes/index.css', 'w' do |f|
    f.write "/*\n *= require_tree .\n */\n"
  end

  # Keymaps are JS-only.
  FileUtils.mkdir_p 'vendor/assets/javascripts/codemirror/keymaps'
  FileUtils.cp Dir.glob(File.join(base, 'keymap', '*.js')),
               'vendor/assets/javascripts/codemirror/keymaps'
  if File.exist? 'vendor/assets/javascripts/codemirror/keymaps/index.js'
    raise 'codemirror/keymaps/index.js already exists'
  end
  File.open 'vendor/assets/javascripts/codemirror/keymaps/index.js', 'w' do |f|
    f.write "//= require_tree .\n"
  end

  # Modes may have both CSS and JS.
  FileUtils.mkdir_p 'vendor/assets/stylesheets/codemirror/modes'
  FileUtils.mkdir_p 'vendor/assets/javascripts/codemirror/modes'
  Dir.entries(File.join(base, 'mode')).each do |mode|
    next if mode[0] == '.'
    mode_dir = File.join base, 'mode', mode
    next unless File.directory?(mode_dir)
    if File.exist? File.join(mode_dir, "#{mode}.css")
      FileUtils.cp File.join(mode_dir, "#{mode}.css"),
                  'vendor/assets/stylesheets/codemirror/modes'
    end
    if File.exist? File.join(mode_dir, "#{mode}.js")
      FileUtils.cp File.join(mode_dir, "#{mode}.js"),
                   'vendor/assets/javascripts/codemirror/modes'
    end
  end
  [%w(stylesheets css), %w(javascripts js)].each do |dir, ext|
    if File.exist? "vendor/assets/#{dir}/codemirror/modes/index.#{ext}"
      raise "codemirror/modes/index.#{ext} already exists"
    end
    File.open "vendor/assets/#{dir}/codemirror/modes/index.#{ext}", 'w' do |f|
      if ext == 'css'
        f.write "/*\n *= require_tree .\n */\n"
      else
        f.write "//= require_tree .\n"
      end
    end
  end

  # Addons may have multiple files.
  FileUtils.mkdir_p 'vendor/assets/stylesheets/codemirror/addons'
  FileUtils.mkdir_p 'vendor/assets/javascripts/codemirror/addons'
  Dir.entries(File.join(base, 'addon')).each do |addon|
    next if addon[0] == '.'
    addon_dir = File.join base, 'addon', addon
    next unless File.directory?(addon_dir)

    FileUtils.mkdir_p File.join(
        'vendor/assets/stylesheets/codemirror/addons', addon)
    FileUtils.mkdir_p File.join(
        'vendor/assets/javascripts/codemirror/addons', addon)

    stylesheets = Dir.glob File.join(addon_dir, '*.css')
    unless stylesheets.empty?
      FileUtils.cp stylesheets,
          File.join('vendor/assets/stylesheets/codemirror/addons', addon)
    end

    javascripts = Dir.glob(File.join(addon_dir, '*.js'))
    javascripts.reject! { |javascript| /(-|_)test\.js$/ =~ javascript }
    unless javascripts.empty?
      FileUtils.cp javascripts,
          File.join('vendor/assets/javascripts/codemirror/addons', addon)
    end

    [%w(stylesheets css), %w(javascripts js)].each do |dir, ext|
      index_path = File.join("vendor/assets/#{dir}/codemirror/addons",
                             addon, "index.#{ext}")
      if File.exist? index_path
        raise "codemirror/addons/#{addon}/index.#{ext} already exists"
      end
      File.open index_path, 'w' do |f|
        if ext == 'css'
          f.write "/*\n *= require_tree .\n */\n"
        else
          f.write "//= require_tree .\n"
        end
      end
    end
  end
end
