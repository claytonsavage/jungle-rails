class UserMailer < ApplicationMailer
	default from: 'no-reply@jungle.com'

	def welcome_email(user)
	
    @user = user
    @products = Product.joins(:line_items).where("order_id =?", @user.id)
    @line_items = LineItem.where("order_id =?", @user.id)
    mail(to: @user.email, subject: "Order number #{@user.id}")
  end
end
 