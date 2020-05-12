class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def order_email(order, user, line_items)
    @order = order

    @user = user
    mail(to: @user.email, 
        subject: "Your order has been placed: Order #{@order.id}"
  )
  end
end