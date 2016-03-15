require 'spec_helper'

describe GroupMe::Chats do

  before do
    @client = GroupMe::Client.new(:token => 'TEST')
  end

  describe '.chats' do

    it "returns user's groups" do
      stub_get('/chats').to_return(json_response('chats.json'))
      chats = @client.chats
      expect(chats.first.last_message.name).to eq('John Doe')
    end

  end

end
