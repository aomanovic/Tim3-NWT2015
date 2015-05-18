class EmptyRecipient < AppException
  def user_friendly_message
    'Recipient must not be empty'
  end
end