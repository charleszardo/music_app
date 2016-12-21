class UserMailer < ApplicationMailer
  default from: 'music_app@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(to: "User <#{user.email}>", subject: 'Welcome to Music App', cc: "Dave <davecharnuska@gmail.com>")
  end
end
