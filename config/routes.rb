Rails.application.routes.draw do 
  match 'inkling' => 'inkling/home#dashboard'
    
  namespace :inkling do
    # match 'update_tree' => 'paths#update_tree', :as => :update_tree    
    # match 'proxy_new' => 'proxying#new', :as => :proxy_new
  
    resources :users, :roles, :themes
      # match 'content_types' => 'content_types#index', :as => :content_types    
  end
end
