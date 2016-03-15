module GroupMe
  module Chats
    # List direct message chats
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing the messages
    # @see https://dev.groupme.com/docs/v3#chats_index
    # @param group_id [String, Integer] Id of the group
    # @param options [Hash] options hash that will be passed to the groupme call
    def chats(options = {})
      get '/chats', options
    end
  end
end

