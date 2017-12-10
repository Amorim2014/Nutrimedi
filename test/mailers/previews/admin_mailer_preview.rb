# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
	def welcome_email
    	AdminMailer.welcome_email(User.first, Order.last)
  end
end
