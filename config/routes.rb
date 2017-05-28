Rails.application.routes.draw do
  
  
  
  post  'order_is_sectors/create',                                   to: 'order_is_sectors#create'        
  match 'order_is_sectors/add/:user_id/:akey_start/:order_id',       to: 'order_is_sectors#add',                                  via: 'get'  
  
  
  patch  'order_is_sectors/update',                                   to: 'order_is_sectors#update'  
  get 'order_is_sectors/info_page'
      
            
  
  root 'order_is_sectors#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  match "*path",                           to: 'order_is_sectors#index',                                  via: 'get'

end
