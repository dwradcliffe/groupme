module GroupMe
  module Members
    # Add members to a group
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#members_add
    # @param id [String, Integer] Id of the group
    # @param members [Array<Hash>] Members to be added
    # @option members [String] :nickname
    # @option members [String] :user_id Existing user id
    # @option members [String] :phone_number
    # @option members [String] :email
    # @option members [String] :guid
    def add_members(id, members)
      post("/groups/#{id}/members/add", members).status == 202
    end

    # Add member to a group
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#members_add
    # @param id [String, Integer] Id of the group
    # @param member [Hash] Member to be added
    # @option member [String] :nickname
    # @option member [String] :user_id Existing user id
    # @option member [String] :phone_number
    # @option member [String] :email
    # @option member [String] :guid
    def add_member(id, member)
      post("/groups/#{id}/members/add", [member]).status == 202
    end

    # Remove a member from a group
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#members_remove
    # @param group_id [String, Integer] Id of the group
    # @param member_id [String, Integer] Id of the member
    def remove_member(group_id, member_id)
      post("/groups/#{group_id}/members/#{member_id}/remove").status == 200
    end

    # Get the membership results from an add call
    #
    # @return [Array<Hashie::Mash>] Array of hashes representing members
    # @see https://dev.groupme.com/docs/v3#members_results
    # @param group_id [String, Integer] Id of the group
    # @param results_id [String, Integer] Id of the results set
    def membership_results(group_id, results_id)
      get("/groups/#{group_id}/members/results/#{results_id}").members
    end
  end
end