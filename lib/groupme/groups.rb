module Groupme
  module Groups

    # List the authenticated user's active groups.
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing groups.
    # @see http://dev.groupme.com/docs/v3#groups_index
    # @example
    #   client = Groupme::Client.new
    #   client.groups
    def groups
      get("/groups")
    end
    alias :list_groups :groups

    # Load a specific group.
    #
    # @return [Hashie::Mash] Hash representing the group.
    # @see http://dev.groupme.com/docs/v3#groups_show
    # @example
    #   client = Groupme::Client.new
    #   client.group(32)
    def group(id)
      get("/groups/#{id}")
    end

    # List the authenticated user's former groups.
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing groups.
    # @see http://dev.groupme.com/docs/v3#groups_index_former
    # @example
    #   client = Groupme::Client.new
    #   client.former_groups
    def former_groups
      get("/groups/former")
    end
    alias :list_former_groups :former_groups

  end
end