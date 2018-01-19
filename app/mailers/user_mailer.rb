class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def welcome_email(user)
	
    #@user = user.stripeEmail
    @user = user
    p @user
    @products = Product.joins(:line_items).where("order_id =?", @user.id)
    @line_items = LineItem.where("order_id =?", @user.id)
    # @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "Order number #{@user.id}")
  end
end
 