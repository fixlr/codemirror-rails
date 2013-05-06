# When using outside of Rails.
# Allows for using Rails asset pipline gems in other
# projects setup to use sprockets, e.g. middlemanapp.com
unless defined? ::Rails
  module Rails
    def self.version
      "3.2.13"
    end

    def self.env
      Class.new do
        def test?
          false
        end
      end.new
    end

    class Engine
    end
  end
end

require 'codemirror/rails'
