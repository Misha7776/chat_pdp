json.extract! chat_room, :id, :name, :chatable_id, :chatable_type, :created_at, :updated_at
json.url chat_room_url(chat_room, format: :json)
