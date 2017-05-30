class AddBaseAdminToAdminUsers < ActiveRecord::Migration[5.0]
  
  AdminUser.create!(:email => 'vitalina.liane@gmail.com', :password => 'password', :password_confirmation => 'password')   
    
end
