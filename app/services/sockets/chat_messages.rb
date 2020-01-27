class Sockets::ChatMessages < Sockets::Base
  private

  def render_message
    ApplicationController.renderer.render(partial: 'chat_messages/show',
                                          locals: { message: resource })
  end

  def stream
    "chat_room/#{resource.chat_room_id}"
  end
end
