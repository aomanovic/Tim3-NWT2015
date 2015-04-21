class NoUserFound < AppException
  def user_friendly_message
    'No user found.'
  end
end