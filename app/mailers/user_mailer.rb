class UserMailer < ApplicationMailer
  default from: 'notifications@odin-facebook.com'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000'
    mail(to: @user.email, subject: 'Welcome to Odin-Facebook!')
  end
end
