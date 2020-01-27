module Mutators
  module ChatRooms
    class Destroy < Mutators::Destroy
      def model
        ChatRoom
      end
    end
  end
end
