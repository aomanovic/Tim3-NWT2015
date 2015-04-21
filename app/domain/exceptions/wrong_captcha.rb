class WrongCaptcha < AppException
  def user_friendly_message
    'Please enter the correct captcha!'
  end
end