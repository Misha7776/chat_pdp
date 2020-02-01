class DeleteUsersIdsFromChatRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :chat_rooms, :user_ids
  end
end
