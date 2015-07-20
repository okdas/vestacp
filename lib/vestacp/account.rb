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
    def self.add_client(raw = {})
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
    def self.delete_user(raw = {})
      args = {
        username: 'arg1',
      }
      params = {}
      raw.each {|key, value| params[args[key].to_sym] = value }
      params.merge!(cmd: 'v-delete-user')
      send_request(params, raw)
    end
  end
end