class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def activation_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Music App")
  end
end
