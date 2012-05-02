# API docs

A tool to help you generate documentation for you API


## Installation

Add gem definition to your Gemfile:
    
``` ruby
gem 'api_docs'
```
    
Bundle it:
    
    bundle install

Add [Twitter bootstrap](http://twitter.github.com/bootstrap) and [Google code pretifyer](http://google-code-prettify.googlecode.com/svn/trunk/README.html) to you CSS manifest file

``` css
//= require bootstrap
//= require prettify
```

Here's what you Javascript manifest file should look like

``` js
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require prettify
//= require api_docs
```

Add your API documentation files to the /doc folder and in your view do:

``` ruby
= render_api_docs %w{login users overview}
```


## Configuration

You can change the default configuration of this gem by adding the following code to your initializers folder:

``` ruby
ApiDocs.configure do |config|
  config.yaml_docs_folder = '/some/other/folder ' # the default folder is /doc/api
end
```


---

Copyright 2012 Jack Neto, [The Working Group, Inc](http://www.theworkinggroup.ca)

