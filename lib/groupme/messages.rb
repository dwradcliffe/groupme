module GroupMe
  module Messages
    # Create a message for a group
    #
    # @return [Hashie::Mash] Hash representing the message
    # @see https://dev.groupme.com/docs/v3#messages_create
    # @param group_id [String, Integer] Id of the group
    # @param text [String] Text of the message
    # @param attachments [Array<Hash>] Array of attachments
    def create_message(group_id, text, attachments=[])
      data = {
        :message => {
          :source_guid => Time.now.to_s,
          :text => text
        }
      }
      data[:message][:attachments] = attachments if attachments.any?
      post("/groups/#{group_id}/messages", data).message
    end

    # List messages for a group
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing the messages
    # @see https://dev.groupme.com/docs/v3#messages_index
    # @param group_id [String, Integer] Id of the group
    def messages(group_id)
      get("/groups/#{group_id}/messages").messages
    end

    # Get number of messages for a group
    #
    # @return [Integer] Number of messages
    # @param group_id [String, Integer] Id of the group
    def messages_count(group_id)
      get("/groups/#{group_id}/messages")['count']
    end
    alias :message_count :messages_count
  end
end
