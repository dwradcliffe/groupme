module GroupMe
  module DirectMessages
    # List direct message between two users
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing the messages
    # @see https://dev.groupme.com/docs/v3#direct_messages_index
    # @param other_user_id [String, Integer] Id of the other user
    # @param options [Hash] options hash that will be passed to the groupme call
    def direct_messages(other_user_id, options = {})
      results = get '/direct_messages', { "other_user_id" => other_user_id }.merge(options)
      results.is_a?(Faraday::Response) ? [] : results.direct_messages
    end
  end
end
