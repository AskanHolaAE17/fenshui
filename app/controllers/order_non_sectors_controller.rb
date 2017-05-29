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
        OrderNonSectorMailer.human_consult(@user).try(:deliver)
        redirect_to root_path + 'order_non_sectors/info_page'   # change state to TRUE after success pay   ## after payment system add
      else
       redirect_to 'https://google.com/'  
      end  
         
    else
       redirect_to 'https://google.com/'  
    end          
    
  end  
  
  
#_____________________________________________________________________________________________________________________________________________


  
  def info_page    
  end  
  
  
#_____________________________________________________________________________________________________________________________________________

  
  
  def feedback_form
    
    user_id = params[:u_id]
    user_akey_start = params[:u_akey]
    
    order_id   = params[:o_id]
    order_akey_start = params[:o_akey]
    
    if User.exists?(id: user_id) and user = User.find(user_id) and user.akey[0..1] == user_akey_start and OrderNonSector.exists?(id: order_id) and order_non_sector = OrderNonSector.find(order_id) and order_non_sector.akey[0..1] == order_akey_start   
      @user = user
      @order_non_sector = order_non_sector
    else  
      redirect_to 'https://google.com/'  
    end
    
  end  

  

#_____________________________________________________________________________________________________________________________________________

  
  
  def send_answer
  
    id = params[:order_non_sector][:id]
    akey_start = params[:order_non_sector][:akey].to_s
    
    if OrderNonSector.exists?(id: id) and @order_non_sector = OrderNonSector.find(id) and @order_non_sector.akey[0..1] == akey_start
      @order_non_sector.answer = params[:order_non_sector][:answer]      
      
      
      if @order_non_sector.save        
        #OrderNonSectorMailer.human_consult(@user).try(:deliver)
        redirect_to root_path + 'order_non_sectors/success'   
      else
       redirect_to 'https://google.com/'  
      end  
         
    else
       redirect_to 'https://google.com/'  
    end         
    
  end  
  
  
#_____________________________________________________________________________________________________________________________________________


  
  def success
    
  end  
#_____________________________________________________________________________________________________________________________________________
 

  
  
  private  
    def root_path
      root_path = (Constant.find_by title: 'root_path').value
    end  
  

end
