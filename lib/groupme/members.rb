module GroupMe
  module Members

    # Add members to a group
    #
    # @return [Boolean] Success/Failure
    # @see http://dev.groupme.com/docs/v3#members_add
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
    # @see http://dev.groupme.com/docs/v3#members_add
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

  end
end