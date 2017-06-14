Rails.application.routes.draw do
  
  
  
  post   'order_is_sectors/create',                                       to: 'order_is_sectors#create'        
  match  'order_is_sectors/add/:user_id/:akey_start/:order_id',           to: 'order_is_sectors#add',                               via: 'get'  
  
  
  patch  'order_is_sectors/update',                                       to: 'order_is_sectors#update'  
  get    'order_is_sectors/info_page'
  post   'order_is_sectors/info_page/:user_id',                           to: 'order_is_sectors#info_page'        
  #match  'order_is_sectors/info_page/:user_id',                           to: 'order_is_sectors#info_page'    
  
  match  'order_is_sectors/success/:user_id',                             to: 'order_is_sectors#success_page',                      via: 'get'  
  match  'order_is_sector/end_form/:user_id/:akey_start/:order_id',       to: 'order_is_sectors#end_form_show',                     via: 'get'      
  
  get    'order_is_sectors/feedback_info_page'
  
  post   'order_is_sectors/end',                                          to: 'order_is_sectors#end'          
  patch  'order_is_sectors/end',                                          to: 'order_is_sectors#end'  
  
  
  
  match  'order_non_sector/create/:user_id/:akey_start',                  to: 'order_non_sectors#create',                           via: 'get'    
  get    'order_non_sectors/success_page'
  get    'order_non_sectors/success'
  get    'order_non_sectors/info_page'
  
  
  match  'order_non_sector/feedback_form/:u_id/:o_akey/:o_id/:u_akey',    to: 'order_non_sectors#feedback_form',                    via: 'get'    
  patch  'order_non_sectors/send_answer',                                 to: 'order_non_sectors#send_answer'             
  get    'order_non_sectors/info_page'
  
            
  
  root 'order_is_sectors#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  
  match "*path",                                                          to: 'order_is_sectors#index',                             via: 'get'

end
