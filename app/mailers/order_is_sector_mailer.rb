class OrderIsSectorMailer < ApplicationMailer
  
  
  default from: 'admin@fenshui.space'

  
  def feedback(user)
    @user = user
    @root_path = (Constant.find_by title: 'root_path').value
    mail(to: @user.email, subject: 'Результати фен шуй консультації')    
  end
  
  
end
