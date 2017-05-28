class OrderNonSectorMailer < ApplicationMailer
  
  
  default from: 'admin@fenshui.space'

  
  def feedback(user)
    @user = user
    @root_path = (Constant.find_by title: 'root_path').value
    @create_order_non_sector = @root_path + 'order_non_sector/create/' + @user.id.to_s + '/' + @user.akey[0..1]
    mail(to: @user.email, subject: 'Результати фен шуй консультації')    
  end
  
  
end
