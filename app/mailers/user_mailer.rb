class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
    
     def welcome_email(user_id)
       @user = User.find(user_id)
       @url  = 'http://example.com/login'
       mail(to: @user.email, subject: 'Welcome to Jungle!')
     end
end
