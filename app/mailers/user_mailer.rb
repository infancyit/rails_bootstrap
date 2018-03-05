class UserMailer < ApplicationMailer
  default from: 'talha@infancyit.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Rails World')
  end

end
