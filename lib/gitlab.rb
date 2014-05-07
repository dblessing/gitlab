require_relative './gitlab/version'
require_relative './gitlab/objectified_hash'
require_relative './gitlab/configuration'
require_relative './gitlab/error'
require_relative './gitlab/request'
require_relative './gitlab/api'
require_relative './gitlab/client'

module Gitlab
  extend Configuration

  # Alias for Gitlab::Client.new
  #
  # @return [Gitlab::Client]
  def self.client(options={})
    Gitlab::Client.new(options)
  end

  # Delegate to Gitlab::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Gitlab::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end
