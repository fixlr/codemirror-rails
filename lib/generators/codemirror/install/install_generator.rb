require 'rails'

module Codemirror
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator installs CodeMirror #{Codemirror::Rails::CODEMIRROR_VERSION}"
      source_root File.expand_path('../../../../../vendor/assets/', __FILE__)

      def copy_codemirror
        say_status("copying", "CodeMirror #{Codemirror::Rails::CODEMIRROR_VERSION}", :green)
        copy_file "javascripts/codemirror.js", "public/javascripts/codemirror.js"
        copy_file "stylesheets/codemirror.css", "public/stylesheets/codemirror.css"
        copy_file "stylesheets/codemirror/themes/default.css", "public/stylesheets/codemirror/themes/default.css"
      end
    end
  end
end if ::Rails.version < "3.1"
