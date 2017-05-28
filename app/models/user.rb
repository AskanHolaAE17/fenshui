class User < ApplicationRecord

  has_many :order_is_sectors
  has_many :order_non_sectors
  
  
  
  before_save { |user| user.email = user.email.downcase }
  



  validates :name,         presence:       { message:       'Введите Ваше имя' },        
                                             
                           length:         { maximum:        100, 
                                             too_long:      'Имя слишком длинное',
                                             :if => :name? }
  
#____________________________________________________________________________________________________________________________________________

                           
  validates :email,        presence:       { message:       'Введите Ваш Email' },      
                                             
                           length:         { maximum:        100, 
                                             too_long:      'Email слишком длинный',
                                             :if => :email? } 

  
end
