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
    alias :list_bots :bots

    # Get a single bot.
    #
    # @return [Hashie::Mash] Hash representing the bot.
    # @see https://dev.groupme.com/docs/v3#bots_show
    # @example
    #   client = GroupMe::Client.new
    #   client.bot(32)
    def bot(id)
      get("/bots/#{id}")
    end
  end
end