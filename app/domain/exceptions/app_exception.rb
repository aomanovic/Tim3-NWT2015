class AppException < StandardError
  def user_friendly_message
    fail
  end
end