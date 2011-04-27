Testapp::Application.routes.draw do 
  namespace :inkling do
    namespace :content_types do
      resources :pages
    end    
  end
  
  inkling_match(:test)
end
