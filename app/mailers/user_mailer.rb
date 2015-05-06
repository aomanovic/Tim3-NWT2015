class UserMailer < ActionMailer::Base
  default from: "no-reply@health-monitor.herokuapp.com"

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirm account on HealthMonitor')
  end

  def reset_password(user, host)
    @user = user
    @host = host
    mail(to: @user.email, subject: 'Request for password reset!')
  end
end






