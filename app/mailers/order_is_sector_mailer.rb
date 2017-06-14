class OrderIsSectorMailer < ApplicationMailer
  
  
  default from: 'admin@fenshui.space'

  
  def feedback(user)
    @user = user
    @root_path = (Constant.find_by title: 'root_path').value
    @create_order_non_sector = @root_path + 'order_non_sector/create/' + @user.id.to_s + '/' + @user.akey[0..1]
    mail(to: @user.email, subject: 'Результати фен шуй консультації')    
  end
  
  
  def form_end(user)
    @user = user
    @root_path = (Constant.find_by title: 'root_path').value
    @form_end = @root_path + 'order_is_sector/end_form/' + @user.id.to_s + '/' + @user.akey[0..1]
    mail(to: @user.email, subject: 'Завершити оформлення замовлення')    
  end  
  
  
end
