require 'rails_helper'

RSpec.describe "chat_rooms/new", type: :view do
  before(:each) do
    assign(:chat_room, ChatRoom.new(
      :name => "",
      :chatable => nil
    ))
  end

  it "renders new chat_room form" do
    render

    assert_select "form[action=?][method=?]", chat_rooms_path, "post" do

      assert_select "input[name=?]", "chat_room[name]"

      assert_select "input[name=?]", "chat_room[chatable_id]"
    end
  end
end
