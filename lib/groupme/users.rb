module GroupMe
  module Users
    # Get details about the authenticated user
    #
    # @return [Hashie::Mash] Hash representing the user
    # @see https://dev.groupme.com/docs/v3#users_me
    def me
      get('/users/me')
    end
  end
end
