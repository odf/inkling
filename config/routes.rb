Rails.application.routes.draw do |map|
  match 'inkling/home', :to => 'inkling/home#dashboard', :as => "user_root"  
    
  namespace :inkling do
    resources :paths, :themes
    match 'update_tree' => 'paths#update_tree', :as => :update_tree    
    match 'proxy_new' => 'proxying#new', :as => :proxy_new

    namespace :admin do
      resources :users, :roles, :permissions
      match 'content_types' => 'content_types#index', :as => :content_types
    end

    devise_for "users", :controllers => { :sessions => "inkling/users/sessions", :passwords => "inkling/users/passwords", :confirmations => "inkling/users/confirmations"}, :class_name => "Inkling::User"
  end
end
