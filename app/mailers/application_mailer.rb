class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@usesms.com.br'
  
  def welcome_email(current_user, order, admin)
    @current_user = current_user
    @order = order
    mail(to: admin.email, subject: "Pedido N° #{order.id}", reply_to:current_user.email)
  end
end