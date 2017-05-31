class OrderNonSectorMailer < ApplicationMailer
  
  
  default from: 'admin@fenshui.space'

  
  def human_consult(user)
    @user  = user
    @order = (@user.order_non_sectors.where payed: false).first
    
    @root_path = (Constant.find_by title: 'root_path').value
    @human_feedback_form_link = @root_path + 'order_non_sector/feedback_form/' + @user.id.to_s + '/' + @order.akey[0..1] + '/' + @order.id.to_s + '/' + @user.akey[0..1]
    
<<<<<<< HEAD
    mail(to: 'vitalina.liane@gmail.com', subject: 'ЛИСТ АДМІНУ: Замовлення консультаії зі спеціалістом')    
=======
    mail(to: 'vitalina.liane@gmail.com', subject: 'ЛИСТ ДЛЯ АДМІНА: Замовлення консультаії зі спеціалістом')    
>>>>>>> ab51f6212ecb17b335859493472a4e6793637b3b
  end


#_____________________________________________________________________________________________________________________________________________


  
  def send_human_answer_to_client(user)
    @user  = user
    @order = (@user.order_non_sectors.where payed: false).last
    
    @root_path = (Constant.find_by title: 'root_path').value
    
    mail(to: @user.email, subject: 'Інструкція від спеціаліста')    
  end
  
  
end
