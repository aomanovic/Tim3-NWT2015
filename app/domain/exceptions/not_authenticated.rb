class NotAuthenticated < AppException
  def user_friendly_message
    'You are not authenticated to perform this request'
  end
end