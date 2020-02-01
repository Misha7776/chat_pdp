class Sockets::ChatMessages < Sockets::Base
  private

  def stream
    "chat_room/#{resource.chat_room_id}"
  end
end
