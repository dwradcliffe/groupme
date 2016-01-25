module GroupMe
  module Bots
    # List the authenticated user's bots.
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing bots.
    # @see https://dev.groupme.com/docs/v3#bots_index
    # @example
    #   client = GroupMe::Client.new
    #   client.bots
    def bots
      get('/bots')
    end
    alias list_bots bots

    # Post a message from a bot.
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#bots_post
    # @param id [String, Integer] ID of the bot
    # @param text [String] Text to send to the group
    # @option options [String] :picture_url Picture URL from image service
    def bot_post(id, text, options = {})
      data = {
        :bot_id => id,
        :text => text
      }
      data[:options] = options if options.any?
      post('/bots/post', data).status == 202
    end

    # Create a new bot.
    #
    # @return [Hashie::Mash] Hash representing the bot.
    # @see https://dev.groupme.com/docs/v3#bots_create
    # @param name [String] Name for the new bot
    # @param group_id [String, Integer] ID of the group
    # @option options [String] :avatar_url Avatar image URL for the bot
    # @option options [String] :callback_url Callback URL for the bot
    def create_bot(name, group_id, options = {})
      data = {
        :bot => options.merge(:name => name, :group_id => group_id)
      }
      post('/bots', data)
    end

    # Remove a bot.
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#bots_destroy
    # @param id [String, Integer] ID of the bot
    def destroy_bot(id)
      data = {
        :bot_id => id
      }
      post('/bots/destroy', data).status == 200
    end
  end
end
