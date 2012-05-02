module BootstrapBuilder::Helper
  
  def bootstrap_form_for(record_or_name_or_array, *args, &proc)
    options = args.extract_options!
    options.merge!(:builder => BootstrapBuilder::Builder)
    options[:html] ||= { }
    options[:html][:class] ||= ''
    if !(options[:html][:class] =~ /form-/)
      options[:html][:class] += ' ' + BootstrapBuilder.config.default_form_class
    end
    form_for(record_or_name_or_array, *(args << options), &proc)
  end
  
end