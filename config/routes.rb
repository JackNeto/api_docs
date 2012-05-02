Rails.application.routes.draw do
  
  resources :api_docs, :only => :index
  
end
