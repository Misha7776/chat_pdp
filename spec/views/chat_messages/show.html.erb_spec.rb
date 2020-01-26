require 'rails_helper'

RSpec.describe "chat_messages/show", type: :view do
  before(:each) do
    @chat_message = assign(:chat_message, ChatMessage.create!(
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
