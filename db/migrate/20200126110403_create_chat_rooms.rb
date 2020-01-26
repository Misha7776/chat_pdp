class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.sting :name
      t.references :chatable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
