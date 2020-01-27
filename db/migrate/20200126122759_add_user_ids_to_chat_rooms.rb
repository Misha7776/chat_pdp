class AddUserIdsToChatRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chat_rooms, :user_ids, :integer, array: true, default: []
  end
end
