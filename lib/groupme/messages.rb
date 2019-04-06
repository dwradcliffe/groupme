require 'securerandom'

module GroupMe
  module Messages
    # Create a message for a group
    #
    # @return [Response] Hash representing the message
    # @see https://dev.groupme.com/docs/v3#messages_create
    # @param group_id [String, Integer] Id of the group
    # @param text [String] Text of the message
    # @param attachments [Array<Hash>] Array of attachments
    def create_message(group_id, text, attachments = [])
      data = {
        :message => {
          :source_guid => SecureRandom.uuid,
          :text => text
        }
      }
      data[:message][:attachments] = attachments if attachments.any?
      post("/groups/#{group_id}/messages", data).message
    end

    # List messages for a group
    #
    # @return [Array<Response>] Array of hashes representing the messages
    # @see https://dev.groupme.com/docs/v3#messages_index
    # @param group_id [String, Integer] Id of the group
    # @param options [Hash] options hash that will be passed to the groupme call
    # @param fetch_all [Boolean] if true, fetches all messages for the group
    def messages(group_id, options = {}, fetch_all = false)
      if fetch_all
        get_all_messages(group_id)
      else
        get_messages(group_id, options)
      end
    end

    # Get number of messages for a group
    #
    # @return [Integer] Number of messages
    # @param group_id [String, Integer] Id of the group
    def messages_count(group_id)
      get("/groups/#{group_id}/messages")['count']
    end
    alias message_count messages_count

    private

    def get_all_messages(group_id)
      messages = []
      last_id = ''
      loop do
        selection = get_messages(group_id, :before_id => last_id)
        break if selection.empty?

        last_id = selection.last.id
        messages << selection
      end

      messages
    end

    def get_messages(group_id, options = {})
      results = get("/groups/#{group_id}/messages", options)
      results.is_a?(Faraday::Response) ? [] : results.messages
    end
  end
end
