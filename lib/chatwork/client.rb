module ChatWork
  class Client < BaseClient
    require "chatwork/client/contacts_methods"
    require "chatwork/client/file_methods"
    require "chatwork/client/incoming_request_methods"
    require "chatwork/client/invitation_link_methods"

    include ContactsMethods
    include FileMethods
    include IncomingRequestMethods
    include InvitationLinkMethods

    # @param api_key      [String]
    # @param access_token [String]
    # @param api_base     [String] default is {ChatWork.api_base}
    # @param api_version  [String] default is {ChatWork.api_version}
    # @note Either api_key or access_token is required
    def initialize(api_key: nil, access_token: nil, api_base: nil, api_version: nil)
      api_base    ||= ChatWork.api_base
      api_version ||= ChatWork.api_version

      header =
        if api_key
          { "X-ChatWorkToken" => api_key }
        elsif access_token
          { "Authorization" => "Bearer #{access_token}" }
        else
          raise "Either api_key or access_token is required"
        end

      super(api_base: api_base, api_version: api_version, header: header)
    end
  end
end
