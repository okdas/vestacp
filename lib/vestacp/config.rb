module Vestacp
  # Vestacp::Config stores configuration data for connecting to the Vestacp API
  class Config
    # The Vestacp API username
    attr_accessor :api_username

    # The Vestacp API password
    attr_accessor :api_password

    # The Vestacp API URL
    attr_accessor :api_url

    # Create a new config object
    def initialize
      @api_username = 'example_user'
      @api_password = 'example_pass'
      @api_url      = 'https://example.com:8083/api/'
    end
  end
end