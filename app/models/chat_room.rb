class ChatRoom < ApplicationRecord
  belongs_to :chatable, polymorphic: true
end
