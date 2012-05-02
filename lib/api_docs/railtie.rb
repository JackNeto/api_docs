# Configure Rails 3.0 to use public/javascripts/jquery et al
module Jquery
  module Rails

    class Railtie < ::Rails::Railtie
      config.before_configuration do
        config.action_view.javascript_expansions[:defaults] |= ['bootstrap']
      end
    end

  end
end