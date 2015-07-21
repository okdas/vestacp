module Vestacp
  # Vestacp::Account is the class for managing clients
  class Account < Base

    # Create User Account
    #
    # Parameters:
    #
    # * <tt>:username</tt>
    # * <tt>:password</tt>
    # * <tt>:email</tt>
    # * <tt>:package</tt>
    # * <tt>:first_name</tt>
    # * <tt>:last_name</tt>
    #
    # See:
    #
    # http://vestacp.com/docs/api/#add_user
    def self.add(raw = {})
      args = {
        username: 'arg1',
        password: 'arg2',
        email: 'arg3',
        package: 'arg4',
        first_name: 'arg5',
        last_name: 'arg6'
      }
      params = {}
      raw.each {|key, value| params[args[key].to_sym] = value }
      params.merge!(cmd: 'v-add-user')
      send_request(params, raw)
    end

    # Delete User Account
    #
    # Parameters:
    #
    # * <tt>:username</tt>
    def self.delete(raw = {})
      args = {
        username: 'arg1'
      }
      params = {}
      raw.each {|key, value| params[args[key].to_sym] = value }
      params.merge!(cmd: 'v-delete-user')
      send_request(params, raw)
    end


    # Suspend User Account
    #
    # Parameters:
    #
    # * <tt>:username</tt>
    def self.suspend(raw = {})
      args = {
        username: 'arg1'
      }
      params = {}
      raw.each {|key, value| params[args[key].to_sym] = value }
      params.merge!(cmd: 'v-suspend-user')
      send_request(params, raw)
    end


    # Suspend User Account
    #
    # Parameters:
    #
    # * <tt>:username</tt>
    def self.unsuspend(raw = {})
      args = {
        username: 'arg1'
      }
      params = {}
      raw.each {|key, value| params[args[key].to_sym] = value }
      params.merge!(cmd: 'v-unsuspend-user')
      send_request(params, raw)
    end


    # List User Account Information
    #
    # Returns JSON.
    #
    # Parameters:
    #
    # * <tt>:username</tt>
    def self.information(raw = {})
      args = {
        username: 'arg1'
      }
      params = {}
      raw.each {|key, value| params[args[key].to_sym] = value }
      params.merge!(cmd: 'v-list-user', arg2: 'json')
      send_request(params, raw, true)
    end

    # Check User Account Credentials
    #
    # Parameters:
    #
    # * <tt>:username</tt>
    # * <tt>:password</tt>
    def self.check_credentials(raw = {})
      args = {
        username: 'arg1',
        password: 'arg2'
      }
      params = {}
      raw.each {|key, value| params[args[key].to_sym] = value }
      params.merge!(cmd: 'v-list-user')
      send_request(params, raw)
    end
  end
end