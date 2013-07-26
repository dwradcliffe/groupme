require 'groupme/groups'
require 'groupme/members'
require 'groupme/bots'
require 'groupme/messages'
require 'groupme/users'
require 'faraday_middleware'

module GroupMe
  class Client

    def initialize(options={})
      @token = options[:token].to_s
      raise ArgumentError, ":token can't be blank" if @token.empty?
    end

    include GroupMe::Groups
    include GroupMe::Members
    include GroupMe::Bots
    include GroupMe::Messages
    include GroupMe::Users

    private

      def get(path)
        request(:get, path)
      end

      def post(path, data)
        request(:post, path, data)
      end

      def request(method, path, data={})
        res = connection.send(method, "v3/#{path}", data)
        if res.status == 200
          return res.body.response
        else
          return res
        end
      end

      # Returns a Faraday::Connection object
      #
      # @return [Faraday::Connection]
      def connection
        @connection ||= Faraday.new 'https://api.groupme.com/' do |f|
          f.request :json
          f.headers[:user_agent] = GroupMe::USER_AGENT
          f.headers["X-Access-Token"] = @token

          # f.response :logger
          f.response :mashify
          f.response :json, :content_type => /\bjson$/

          f.adapter Faraday.default_adapter
        end
      end

  end
end