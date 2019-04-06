module GroupMe
  module Groups
    # List the authenticated user's active groups.
    #
    # @return [Array<Response>] Array of hashes representing groups.
    # @see https://dev.groupme.com/docs/v3#groups_index
    # @example
    #   client = GroupMe::Client.new
    #   client.groups
    def groups
      get '/groups'
    end
    alias list_groups groups

    # Load a specific group.
    #
    # @return [Response] Hash representing the group.
    # @see https://dev.groupme.com/docs/v3#groups_show
    # @param id [String, Integer] The ID of the group
    # @example
    #   client = GroupMe::Client.new
    #   client.group(32)
    def group(id)
      get "/groups/#{id}"
    end

    # List the authenticated user's former groups.
    #
    # @return [Array<Response>] Array of hashes representing groups.
    # @see https://dev.groupme.com/docs/v3#groups_index_former
    # @example
    #   client = GroupMe::Client.new
    #   client.former_groups
    def former_groups
      get '/groups/former'
    end
    alias list_former_groups former_groups

    # Create a new group.
    #
    # @return [Response] Hash representing the group
    # @see https://dev.groupme.com/docs/v3#groups_create
    # @param name [String] Name for the new group
    # @param options [Hash] Group information
    # @option options [String] :description Description of the group
    # @option options [String] :image_url GroupMe Image Service URL
    # @option options [Boolean] :share If you pass a true value, a share URL will be generated
    def create_group(name, options = {})
      options[:name] = name
      post '/groups', options
    end

    # Update a group after creation
    #
    # @return [Response] Hash representing the group
    # @see https://dev.groupme.com/docs/v3#groups_update
    # @param name [Integer] Group ID
    # @param data [Hash] Group information
    # @option data [String] :name Name of the group
    # @option data [String] :description Description of the group
    # @option data [String] :image_url GroupMe Image Service URL
    # @option options [Boolean] :share If you pass a true value, a share URL will be generated
    def update_group(group_id, data)
      post "/groups/#{group_id}/update", data
    end

    # Disband a group
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#groups_destroy
    def destroy_group(group_id)
      post("/groups/#{group_id}/destroy").status == 200
    end

    # Join a shared group
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#groups_join
    def join_group(group_id, share_token)
      post("/groups/#{group_id}/join/#{share_token}").status == 200
    end
  end
end
