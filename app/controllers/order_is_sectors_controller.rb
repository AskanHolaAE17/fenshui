class OrderIsSectorsController < ApplicationController
  
protect_from_forgery with: :null_session  
before_action :root_path, only: [:create, :update]  
  

  
  def index    
    @main_page_content_tmp = (Main.find_by title: 'main_page_content_tmp').content
    @user = User.new
    
  end
  
  
#_____________________________________________________________________________________________________________________________________________ 


  
  def create    
    @user = User.new(user_params)
    @user.akey = akey
      
    if @user.save      
      @order_is_sector      = @user.order_is_sectors.build
      @order_is_sector.akey = akey      
      

        if @order_is_sector.save          
          user_id = @user.id.to_s          
          akey_start = @order_is_sector.akey[0..1]
          order_is_sector_id = @order_is_sector.id.to_s
          
          redirect_to root_path + 'order_is_sectors/add/' + user_id + '/' + akey_start + '/' + order_is_sector_id
          
        else
          redirect_to order_is_sector_path(@user) 
        end

      
    else
      redirect_to order_is_sector_path(@user) 
    end
    
  end  
  
  

#_____________________________________________________________________________________________________________________________________________
  
  
  
  def add
    
    user_id = params[:user_id]
    akey_start = params[:akey_start].to_s        
    order_is_sector_id = params[:order_id]
    
    if User.exists?(id: user_id) and @user = User.find(user_id) and OrderIsSector.exists?(id: order_is_sector_id) and @order_is_sector = OrderIsSector.find(order_is_sector_id)
       @order_is_sector = (@user.order_is_sectors.where payed: false).first
       @year_start = Time.now.year 
       @year_end   = @year_start + 1
      
       unless @order_is_sector and @order_is_sector.akey[0..1].to_s == akey_start
         redirect_to 'https://google.com/'
       end  
      
    else
       redirect_to 'https://google.com/'
    end  
    
  end  


#_____________________________________________________________________________________________________________________________________________ 

  

  def update
    
    id = params[:order_is_sector][:id]
    akey_start = params[:order_is_sector][:akey]
    
    
    def create_pay_link(user_id)
      
      public_key   = 'i35395571497'
      private_key  = 'irj04vFv5A7g7pdVVd' + (Constant.find_by title: 'private_key').value
      api_version  = 3
      @pay_way     = 1
      
      liqpay = Liqpay::Liqpay.new(
        :public_key  => public_key,
        :private_key => private_key
      ) 
      
      def encode_json(params)
        JSON.generate(params)
      end    
    
      def encode64(params)
        (Base64.encode64 params).chomp.delete("\n")
      end


      def cnb_form_request(params = {}, liqpay, public_key, api_version)
        params[:public_key] = public_key
        json_params = encode64 encode_json params
        signature = liqpay.cnb_signature params            
        @liqpay_url = "https://liqpay.com/api/#{api_version}/checkout?data=#{json_params.to_s}&signature=#{signature.to_s}"
      end
      
      
      
      html = cnb_form_request({
        :version          => api_version,
        :action           => 'pay',
        :amount           => (Payment.find_by title: 'order_is_sector_price').value,
        :currency         => 'UAH',
        :description      => 'Оплата заказа',
        :server_url       => root_path + 'order_is_sectors/success_page' + user_id.to_s,
        :result_url       => root_path + 'order_is_sectors/info_page',
        :sandbox          => @pay_way        
      }, liqpay, public_key, api_version)        
      
      
      html
      
    end  
    
    
    
    if OrderIsSector.exists?(id: id) and @order_is_sector = OrderIsSector.find(id) and @order_is_sector.akey[0..1] == akey_start
      #@order_is_sector.sector = params[:order_is_sector][:sector]
      @order_is_sector.orientation = params[:order_is_sector][:orientation] 
      @order_is_sector.price  = (Payment.find_by title: 'order_is_sector_price').value
      
      @user = User.find(@order_is_sector.user_id)
      #@user.birthday = params[:order_is_sector][:birthday]
      #@user.update_attribute(:birthday, params[:order_is_sector][:birthday])
      
      if @user.save and @order_is_sector.save                    
        pay_link = create_pay_link(@user.id)   
        redirect_to pay_link
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


  
  def success_page     
    user_id = params[:user_id]
    @user   = User.find(user_id)
    @order  = @user.order_is_sectors.last
    @order.payed = true
    @order.save
    OrderIsSectorMailer.feedback(@user).try(:deliver)
  end    
  
  
#_____________________________________________________________________________________________________________________________________________    
  

  def feedback
    
  end    
#_____________________________________________________________________________________________________________________________________________   

    
  
  private  
    def root_path
      root_path = (Constant.find_by title: 'root_path').value
    end  
  
    
    def user_params
      params.require(:user).permit(:name, :email, :akey)
    end  

end
