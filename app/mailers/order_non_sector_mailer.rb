class OrderNonSectorMailer < ApplicationMailer
  
  
  default from: 'admin@fenshui.space'

  
  def human_consult(user)
    @user  = user
    @order = (@user.order_non_sectors.where payed: false).first
    
    @root_path = (Constant.find_by title: 'root_path').value
    @human_feedback_form_link = @root_path + 'order_non_sector/feedback_form' + @user.id.to_s + '/' + @order.akey[0..1] + '/' + @order.id.to_s + '/' + @user.akey[0..1]
    
    mail(to: 'mi.creator@yahoo.com', subject: 'Замовлення консультаії зі спеціалістом')    
  end
  
  
end
