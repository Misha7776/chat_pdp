# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat_room, only: %i[show edit update destroy]

  def index
    @chat_rooms = ChatRoom.all.includes(:chatable).by_user(current_user)
  end

  def show; end

  def new
    @chat_room = current_user.chat_rooms.new
    @users = User.where.not(id: current_user.id)
  end

  def edit; end

  def create
    binding.pry
    @chat_room = Mutators::ChatRooms::Create.call(current_user, chat_room_params)
    respond_to do |format|
      if @chat_room.valid?
        format.html { redirect_to @chat_room, notice: 'Chat room was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    # Mutators::ChatRooms::Update.call(@chat_room, chat_room_params)
    respond_to do |format|
      if @chat_room.update(chat_room_params)
        format.html { redirect_to @chat_room, notice: 'Chat room was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    # Mutators::ChatRooms::Destroy.call(@chat_room)
    @chat_room.destroy
    respond_to do |format|
      format.html { redirect_to chat_rooms_url, notice: 'Chat room was successfully destroyed.' }
    end
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def chat_room_params
    params.require(:chat_room).permit(:name)
          .merge!(user_ids: params[:user_ids] + [current_user.id])
  end
end
