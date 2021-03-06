class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chat_rooms, as: :chatable, dependent: :destroy
  has_many :chat_room_users
  has_many :conversations, through: :chat_room_users, source: :chat_room
end
