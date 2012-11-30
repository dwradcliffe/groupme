module GroupMe
  module Groups

    # List the authenticated user's active groups.
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing groups.
    # @see http://dev.groupme.com/docs/v3#groups_index
    # @example
    #   client = GroupMe::Client.new
    #   client.groups
    def groups
      get "/groups"
    end
    alias :list_groups :groups

    # Load a specific group.
    #
    # @return [Hashie::Mash] Hash representing the group.
    # @see http://dev.groupme.com/docs/v3#groups_show
    # @param id [String, Integer] The ID of the group
    # @example
    #   client = GroupMe::Client.new
    #   client.group(32)
    def group(id)
      get "/groups/#{id}"
    end

    # List the authenticated user's former groups.
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing groups.
    # @see http://dev.groupme.com/docs/v3#groups_index_former
    # @example
    #   client = GroupMe::Client.new
    #   client.former_groups
    def former_groups
      get '/groups/former'
    end
    alias :list_former_groups :former_groups

    # Create a new group.
    #
    # @return [Hashie::Mash] Hash representing the group
    # @see
    # @param name [String] Name for the new group
    # @param options [Hash] Group information
    # @option options [String] :description Description of the group
    # @option options [String] :image Base64 JPEG or PNG data
    def create_group(name, options={})
      options.merge! :name => name
      post '/groups', options
    end

  end
end