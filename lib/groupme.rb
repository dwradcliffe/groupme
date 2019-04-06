require 'hashie'
require 'groupme/version'
require 'groupme/client'

module GroupMe
  # Fix bug with Hashie warnings
  class Response < Hashie::Mash
    disable_warnings
  end

  USER_AGENT = "dwradcliffe/groupme/#{GroupMe::VERSION}".freeze
end
