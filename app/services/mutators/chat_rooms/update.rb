module Mutators
  module ChatRooms
    class Update < Mutators::Update
      def model
        ChatRoom
      end
    end
  end
end
