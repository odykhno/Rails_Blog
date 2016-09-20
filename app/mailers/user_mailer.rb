class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome(user)
    @user = user
    if @user.email
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
  end
end
