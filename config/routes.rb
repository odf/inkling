Rails.application.routes.draw do |map|
  namespace :inkling do
    resources :paths, :themes
    match 'update_tree' => 'paths#update_tree', :as => :update_tree    
    match 'proxy_new' => 'proxying#new', :as => :proxy_new

    namespace :admin do
      resources :users, :roles, :permissions
      match 'content_types' => 'content_types#index', :as => :content_types
    end

    match 'home', :to => 'inkling/home#dashboard', :as => "inkling_user_root"  
    devise_for "users", :controllers => { :sessions => "inkling/users/sessions", :passwords => "inkling/users/passwords", :confirmations => "inkling/users/confirmations"}, :class_name => "Inkling::User"
  end
      
  # namespace :inkling do
  #   devise_for "users", :controllers => { :sessions => "inkling/users/sessions", :passwords => "inkling/users/passwords", :confirmations => "inkling/users/confirmations"}, :class_name => "Inkling::User"
  # end 
end
