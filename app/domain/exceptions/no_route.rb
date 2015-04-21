class NoRoute < AppException
  def user_friendly_message
    'Page not found'
  end
end