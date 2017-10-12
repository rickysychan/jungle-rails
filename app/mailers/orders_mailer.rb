class OrdersMailer < ApplicationMailer
    def receipt(order_id)
        @order = Order.find(order_id)
        @url  = 'http://example.com/login'
        mail(to: @order.email, subject: 'Your Jungle order reciept')
    end
end