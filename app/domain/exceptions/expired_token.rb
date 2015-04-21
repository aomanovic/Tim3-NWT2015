class ExpiredToken < AppException
  def user_friendly_message
    'Your session has expired'
  end
end