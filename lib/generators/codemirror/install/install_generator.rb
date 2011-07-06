require 'rails'

module Codemirror
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator installs CodeMirror #{Codemirror::Rails::CODEMIRROR_VERSION}"
      source_root File.expand_path('../../../../../vendor/assets/', __FILE__)
      class_option :overlay, :type => :boolean, :default => false,
        :desc => "Install the assets for mode overlays"
      class_option :runmode, :type => :boolean, :default => false,
        :desc => "Install the assets for running a CodeMirror outside the editor"

      modes = Dir["#{source_root}/javascripts/codemirror/modes/*.js"].collect do |path|
        mode = path.gsub(/.+\/(.+?)\.js/, '\1')

        class_option "with-#{mode}".to_sym, :type => :boolean, :default => false, :group => 'mode',
          :desc => "Install the assets for the #{mode} mode"
      end

      def copy_codemirror
        say_status("copying", "CodeMirror #{Codemirror::Rails::CODEMIRROR_VERSION}", :green)
        copy_file "javascripts/codemirror.js", "public/javascripts/codemirror.js"
        copy_file "stylesheets/codemirror.css", "public/stylesheets/codemirror.css"
        copy_file "stylesheets/codemirror/themes/default.css", "public/stylesheets/codemirror/themes/default.css"
      end

      def copy_modes
        options.keys.grep(/with-/).each do |option|
          mode = option.gsub('with-', '')
          copy_file "javascripts/codemirror/modes/#{mode}.js", "public/javascripts/codemirror/modes/#{mode}.js"
        end
      end

      def copy_overlay
        if options.overlay?
          copy_file "javascripts/codemirror/overlay.js", "public/javascripts/codemirror/overlay.js"
        end
      end

      def copy_runmode
        if options.runmode?
          copy_file "javascripts/codemirror/runmode.js", "public/javascripts/codemirror/runmode.js"
        end
      end
    end
  end
end if ::Rails.version < "3.1"
