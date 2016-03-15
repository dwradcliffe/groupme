require 'spec_helper'

describe GroupMe::DirectMessages do

  before do
    @client = GroupMe::Client.new(:token => 'TEST')
  end

  describe '.direct_messages' do

    it "returns direct messages between two users" do
      stub_get('/direct_messages?other_user_id=1234567890').to_return(json_response('direct_messages.json'))
      direct_messages = @client.direct_messages(1234567890)
      expect(direct_messages.first.name).to eq('John')
    end

  end

end

