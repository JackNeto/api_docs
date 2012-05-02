module ApiDocs
  class Configuration

    # Where to find the folder with the yaml docs
    attr_accessor :yaml_docs_folder
        
    # Configuration defaults
    def initialize
      @yaml_docs_folder = '/doc'
    end
    
  end
end