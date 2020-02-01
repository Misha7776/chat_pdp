class ChatRoom < ApplicationRecord
  belongs_to :chatable, polymorphic: true
  has_many :chat_messages, dependent: :destroy
  has_many :chat_room_users, dependent: :destroy
  has_many :members, through: :chat_room_users, source: :user

  scope :by_user, ->(user) { where('user_ids @> ?', "{#{user.id}}") }
end
