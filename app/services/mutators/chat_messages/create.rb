module Mutators
  module ChatMessages
    class Create < Mutators::Create
      def model
        ChatMessage
      end
    end
  end
end
