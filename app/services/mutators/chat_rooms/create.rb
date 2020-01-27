# frozen_string_literal: true

module Mutators
  module ChatRooms
    class Create < Mutators::Create
      def initialize(chatable, params)
        @chatable = chatable
        @params = params
      end

      def self.call(chatable, params)
        new(chatable, params).call
      end

      private

      attr_reader :chatable

      def record
        @record ||= chatable.chat_rooms.new(params)
      end
    end
  end
end
