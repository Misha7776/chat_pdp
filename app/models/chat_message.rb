class ChatMessage < ApplicationRecord
  belongs_to :chat_room
  belongs_to :user
  validates :body, presence: true

  after_commit { Sockets::ChatMessagesJob.perform_later(self) }
end
