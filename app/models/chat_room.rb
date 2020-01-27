class ChatRoom < ApplicationRecord
  belongs_to :chatable, polymorphic: true
  has_many :chat_messages, dependent: :destroy

  scope :by_user, ->(user) { where('user_ids @> ?', "{#{user.id}}") }
end
