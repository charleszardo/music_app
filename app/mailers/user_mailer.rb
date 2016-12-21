class UserMailer < ApplicationMailer
  default from: 'davecharnuska@example.com'

  def welcome_email(user)
    @user = user
    @activate_url = "http://localhost:3000/users/activate?activation_token=#{user.activation_token}"
    mail(to: @user.email, subject: 'Welcome to Music App')
  end
end
