module ChatMessagesHelper
  def message_class(current_user, message)
    current_user.id == message.user_id ? 'message-sent' : 'message-received'
  end

  def message_style(current_user, message)
    current_user.id == message.user_id ? 'float: right;' : ''
  end
end
