FactoryBot.define do
  factory :chat_message do
    body { "MyText" }
    user { nil }
  end
end
