module Codemirror
  module Rails
    if ::Rails.version < "3.1"
      require 'codemirror/rails/railtie'
    end
    require 'codemirror/rails/version'
  end
end
