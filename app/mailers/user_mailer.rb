class UserMailer < ApplicationMailer
  default from: 'notifications@odin-facebook.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to Odin-Facebook')
  end
end
