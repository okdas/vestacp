require "vestacp/version"

module Vestacp
  autoload :Config,  "vestacp/config"
  autoload :Base,  "vestacp/base"
  autoload :Account,  "vestacp/account"

  class << self
    attr_accessor :config
  end

  self.config ||= Config.new

  # Pass a block to configure the Vestacp API
  #
  #   Vestacp.configure do |config|
  #     config.api_username = 'admin'
  #     config.api_password = 'n0passw0rd'
  #     config.api_url      = 'https://example.com:8083/api/'
  #   end

  def self.configure
    yield config
    config
  end
end


