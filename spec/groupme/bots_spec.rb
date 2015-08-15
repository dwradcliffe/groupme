require 'spec_helper'

describe GroupMe::Bots do

  before do
    @client = GroupMe::Client.new(:token => 'TEST')
  end

  describe '.bots' do

    it "returns user's bots" do
      stub_get('/bots').to_return(json_response('bots.json'))
      bots = @client.bots
      expect(bots.first.name).to eq('hal9000')
    end

  end

  describe '.bot' do

    it 'returns the matching bot' do
      stub_get('/bots/1234567890').to_return(json_response('bot.json'))
      bot = @client.bot(1234567890)
      expect(bot.name).to eq('hal9000')
    end

  end

  describe '.create_bot' do

    it 'creates a new bot' do
      data = {
        :bot => {
          :name => 'hal9000',
          :group_id => 1234567890
        }
      }
      stub_post('/bots', data).to_return(json_response('bot.json', 201))
      bot = @client.create_bot('hal9000', 1234567890)
      expect(bot.name).to eq('hal9000')
    end

  end

  describe '.destroy_bot' do

    it 'destroys a bot' do
      data = {
        :bot_id => 1234567890
      }
      stub_post('/bots/destroy', data).to_return(:status => 200)
      response = @client.destroy_bot(1234567890)
      expect(response).to eq(true)
    end

  end

end
