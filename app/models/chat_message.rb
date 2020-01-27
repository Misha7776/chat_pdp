class ChatMessage < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user

  after_commit { Sockets::ChatMessagesJob.perform_later(self) }
end
