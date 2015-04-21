class NoActiveSprint < AppException
  def user_friendly_message
    'The project does not have an active sprint'
  end
end