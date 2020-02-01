# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room, only: %i[show edit update destroy]
  before_action :set_members, only: %i[new edit]

  def index
    @chat_rooms = current_user.conversations.includes(:members)
  end

  def show; end

  def new
    @chat_room = current_user.chat_rooms.new
  end

  def edit; end

  def create
    @chat_room = Mutators::ChatRooms::Create.call(current_user, chat_room_params)
    if @chat_room.valid?
      redirect_to @chat_room, notice: 'Chat room was successfully created.'
    else
      redirect_to new_chat_room_path, alert: @chat_room.errors.full_messages.join(',')
    end
  end

  def update
    if Mutators::ChatRooms::Update.call(@chat_room, chat_room_params)
      redirect_to @chat_room, notice: 'Chat room was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    Mutators::ChatRooms::Destroy.call(@chat_room)
    redirect_to chat_rooms_url, notice: 'Chat room was successfully destroyed.'
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def set_members
    @members = User.where.not(id: current_user.id)
  end

  def chat_room_params
    params.require(:chat_room).permit(:name, member_ids: [])
  end
end
