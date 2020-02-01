module Mutators
  module ChatRooms
    class Update < Mutators::Update
      def call
        record.update(update_params)
      end

      def model
        ChatRoom
      end

      private

      def update_params
        params[:member_ids] = params[:member_ids].reject(&:blank?).map(&:to_i)
        params[:member_ids] << record.chatable_id
        params
      end
    end
  end
end
