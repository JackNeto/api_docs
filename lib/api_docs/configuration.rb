module BootstrapBuilder
  class Configuration

    # The templates folder 
    attr_accessor :template_folder
        
    # The templates folder 
    attr_accessor :default_form_class

    # Configuration defaults
    def initialize
      @template_folder = :bootstrap_builder
      @default_form_class = 'form-horizontal'
    end
    
  end
end