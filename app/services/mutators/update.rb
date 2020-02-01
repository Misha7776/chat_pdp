# frozen_string_literal: true

module Mutators
  class Update
    def initialize(record, params)
      @record = define_record(record)
      @params = params
    end

    def self.call(record, params)
      new(record, params).call
    end

    def call
      record.update(params)
    end

    protected

    attr_reader :params, :record

    def define_record(record)
      return record if record.is_a?(model)

      model.find(record)
    end
  end
end
