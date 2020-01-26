require 'rails_helper'

RSpec.describe "chat_messages/new", type: :view do
  before(:each) do
    assign(:chat_message, ChatMessage.new(
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders new chat_message form" do
    render

    assert_select "form[action=?][method=?]", chat_messages_path, "post" do

      assert_select "textarea[name=?]", "chat_message[body]"

      assert_select "input[name=?]", "chat_message[user_id]"
    end
  end
end
