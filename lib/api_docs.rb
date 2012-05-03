require 'api_docs/engine'
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


  module ApplicationExtensions

    def self.included(base)
      base.send(:include, ApiDocs::ApplicationExtensions::InstanceMethods)
      base.send(:helper_method, :render_api_docs) if base.respond_to?(:helper_method)
    end

    module InstanceMethods

      def render_api_docs(docs)
        @api_docs = {}
        docs.each do |section|
          @api_docs[section] = YAML::load(File.open("#{Rails.root}#{ApiDocs.config.yaml_docs_folder}/#{section}.yml"))
        end
        render_to_string(:partial => 'api_docs/api_docs').html_safe
      end

    end
  end
end

ActionController::Base.send(:include, ApiDocs::ApplicationExtensions)
