require 'api_docs/engine'
require 'api_docs/builder'
require 'api_docs/helper'
require 'api_docs/configuration'

module ApiDocs
  class << self

    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
    alias :config :configuration

  end
end

