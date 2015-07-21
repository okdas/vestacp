require 'faraday'
require 'json'

module Vestacp
  # Vestacp::Base is the main class used to subclass Vestacp API resources
  class Base

    # Sends an API request to the Vestacp API
    #
    # Parameters:
    # * <tt>:cmd</tt> - The API action to perform
    #
    # All other paramters are passed along as HTTP POST variables
    def self.send_request(params = {}, raw = {}, json_response = false)
      if params[:cmd].blank?
        raise "No API command set"
      end

      if !raw[:server]
        raise "No server as argument and server configuration!" unless Vestacp.config
        raw[:server] = {
          api_username: Vestacp.config.api_username,
          api_password: Vestacp.config.api_password,
          api_url: Vestacp.config.api_url
        }
      end

      params.merge!(
        user: raw[:server][:api_username],
        password: raw[:server][:api_password]
      )

      # params.merge!(returncode: 'yes') unless params[:returncode]

      url = URI.parse(raw[:server][:api_url])

      # SSL without is really bad design. In order to support even self-signed
      # certificates I should do that.
      conn = Faraday.new(:url => url, ssl: { verify: false }) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      response = conn.post do |req|
        req.body = params
      end

      parse_response(json_response ? JSON.parse(response.body) : response.body)
    end

    # Parse VestaCP responses.
    # TODO: add more responses.
    #
    # See: http://vestacp.com/docs/api/#return_codes
    def self.parse_response(raw, json_response = false)
      case raw
      when 'OK'
        {error: false, response: raw}
      when /^Error/
        {error: true, response: raw}
      else
        {error: false, response: raw}
      end

      # case raw
      # when '0'
      #   {
      #     error: false, value: raw, name: 'OK',
      #     comment: 'Command has been successfuly performed.'
      #   }
      # when '1'
      #   {
      #     error: true, value: raw, name: 'E_ARGS',
      #     comment: 'Not enough arguments provided.'
      #   }
      # when '2'
      #   {
      #     error: true, value: raw, name: 'E_INVALID',
      #     comment: 'Object or argument is not valid.'
      #   }
      # when '3'
      #   {
      #     error: true, value: raw, name: 'E_NOTEXIST',
      #     comment: "Object doesn't exist."
      #   }
      # else
      #   {
      #     error: true, value: '-1', name: 'E_UNKNOWN',
      #     comment: "Unknown response: #{raw}"
      #   }
      # end
    end
  end
end