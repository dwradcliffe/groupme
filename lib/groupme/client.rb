require 'groupme/authentication'
require 'groupme/groups'
require 'groupme/members'
require 'groupme/bots'
require 'faraday_middleware'

module Groupme
  class Client

    def initialize(options={})
      @token = options.delete(:token)
    end

    include Groupme::Groups
    include Groupme::Members
    include Groupme::Bots

    private

      def get(path)
        request(:get, path)
      end

      def post(path, data)
        request(:post, path, data)
      end

      def request(method, path, data={})
        connection.send(method, "v3/#{path}", data).body.response
      end

      # Returns a Faraday::Connection object
      #
      # @return [Faraday::Connection]
      def connection
        @connection ||= Faraday.new 'https://api.groupme.com/' do |f|
          f.request :oauth2, @token if @token
          f.request :json
          f.headers[:user_agent] = Groupme::USER_AGENT

          # f.response :logger
          f.response :mashify
          f.response :json, :content_type => /\bjson$/

          f.adapter Faraday.default_adapter
        end
      end

  end
end