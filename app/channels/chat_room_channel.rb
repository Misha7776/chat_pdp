class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room/#{params['chat_room_id']}" if params['chat_room_id'].present?
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    return unless chat_member?(data)

    Mutators::ChatMessages::Create.call(chat_message_params(data))
  end

  private

  def chat_member?(data)
    ChatRoom.find(data['chat_room_id']).member_ids.include?(data['user_id'].to_i)
  end

  def chat_message_params(data)
    data.slice('chat_room_id', 'user_id', 'body')
  end
end
