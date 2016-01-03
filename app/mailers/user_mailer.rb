class UserMailer < ApplicationMailer
  def welcome(user_id)
    @user = User.find user_id
    @url  = 'http://www.lemontool.com/login'
    return false if @user.blank?
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
