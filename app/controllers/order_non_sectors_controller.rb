class OrderNonSectorsController < ApplicationController
  
  
before_action :root_path, only: [:create]  
  

  
  def create    
    
    user_id = params[:user_id]
    akey_start = params[:akey_start].to_s
    
    if User.exists?(id: user_id) and @user = User.find(user_id) and @user.akey[0..1] == akey_start
      @order_is_sector = (@user.order_is_sectors.where payed: false).first
      
      @order_non_sector        = @user.order_non_sectors.build
      @order_non_sector.akey   = akey      
      @order_non_sector.sector = @order_is_sector.sector
      @order_non_sector.price  = (Payment.find_by title: 'order_non_sector_price').value
      
      
      if @order_non_sector.save
        redirect_to root_path + 'order_non_sectors/info_page_client'   # change state to TRUE after success pay   ## after payment system add
        OrderNonSectorMailer.ask_human(@user).try(:deliver)
      else
       redirect_to 'https://google.com/'  
      end  
         
    else
       redirect_to 'https://google.com/'  
    end          
    
  end  
#_____________________________________________________________________________________________________________________________________________
 

  
  
  private  
    def root_path
      root_path = (Constant.find_by title: 'root_path').value
    end  
  

end
