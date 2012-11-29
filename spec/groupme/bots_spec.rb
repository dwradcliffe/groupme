require 'spec_helper'

describe GroupMe::Bots do

  before do
    @client = GroupMe::Client.new(:token => "TEST")
  end

  describe ".bots" do

    it "returns user's bots" do
      stub_get("/bots").to_return(json_response("bots.json"))
      bots = @client.bots
      expect(bots.first.name).to eq("hal9000")
    end

  end

  describe ".bot" do

    it "returns the matching bot" do
      stub_get("/bots/1234567890").to_return(json_response("bot.json"))
      bot = @client.bot(1234567890)
      expect(bot.name).to eq("hal9000")
    end

  end

end