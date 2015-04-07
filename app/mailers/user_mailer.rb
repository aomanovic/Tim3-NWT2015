class UserMailer < ActionMailer::Base
  default from: "noresponse@hm.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Health Monitor Site')
  end

  def password_recovery(user, prt)
    @user = user
    @prt = prt
    mail(to: @user.email, subject: 'Password recovery')
  end

  def password_reset(user, password)
    @user = user
    @password = password
    mail(to: @user.email, subject: 'Password reset')
  end

  def activate_account(user)
    @user = user
    mail(to: @user.email, subject: 'Account activation')
  end
end