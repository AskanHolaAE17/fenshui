class OrderIsSectorsController < ApplicationController
  
  
  
  def index
    
    @main_page_content_tmp = (Main.find_by title: 'main_page_content_tmp').content
    
  end
  
  
  
  def create
    
    @order_is_sector = OrderIsSector.new    
    
  end  
  
  
  
end
