module GroupMe
  module Likes
    # Like a message
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#likes_create
    def create_like(group_id, message_id)
      post("/messages/#{group_id}/#{message_id}/like").status == 200
    end

    # Unlike a liked message
    #
    # @return [Boolean] Success/Failure
    # @see https://dev.groupme.com/docs/v3#likes_destroy
    def destroy_like(group_id, message_id)
      post("/messages/#{group_id}/#{message_id}/unlike").status == 200
    end
  end
end
