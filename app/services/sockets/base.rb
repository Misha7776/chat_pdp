# frozen_string_literal: true

class Sockets::Base
  def initialize(resource)
    @resource = resource
  end

  def self.call(resource)
    new(resource).call
  end

  def call
    broadcast(stream, resource: resource )
  end

  private

  attr_reader :resource

  def broadcast(stream, message)
    ActionCable.server.broadcast(stream, message)
  end

  def stream
    raise 'Set method in child class'
  end

  def render_message
    raise 'Set method in child class'
  end
end
