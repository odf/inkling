# Rails.application.routes.draw do 
#   match 'inkling/home' => 'inkling/home#dashboard'
#     
#   namespace :inkling do
#     resources :paths, :themes, :feeds
#     # match 'update_tree' => 'paths#update_tree', :as => :update_tree    
#     # match 'proxy_new' => 'proxying#new', :as => :proxy_new
#   
#     namespace :admin do
#       resources :users, :roles, :permissions
#       match 'content_types' => 'content_types#index', :as => :content_types
#     end
#   end
# end
