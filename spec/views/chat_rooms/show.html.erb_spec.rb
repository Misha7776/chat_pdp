require 'rails_helper'

RSpec.describe "chat_rooms/show", type: :view do
  before(:each) do
    @chat_room = assign(:chat_room, ChatRoom.create!(
      :name => "",
      :chatable => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end