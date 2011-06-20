# Configure Rails 3.0 to use public/javascripts/codemirror et al
module Codemirror
  module Rails
    class Railtie < ::Rails::Railtie
      config.before_configuration do
        config.action_view.javascript_expansions[:defaults] << 'codemirror'
      end
    end
  end
end
