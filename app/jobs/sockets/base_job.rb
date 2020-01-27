class Sockets::BaseJob < ApplicationJob
  queue_as :default

  def perform(resource)
    @resource = resource

    socket_class.call(resource)
  end

  private

  attr_reader :resource

  def socket_class
    "Sockets::#{resource.class.name.pluralize}".constantize
  end
end
