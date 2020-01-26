require 'rails_helper'

RSpec.describe "chat_messages/index", type: :view do
  before(:each) do
    assign(:chat_messages, [
      ChatMessage.create!(
        :body => "MyText",
        :user => nil
      ),
      ChatMessage.create!(
        :body => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of chat_messages" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
