require 'spec_helper'

describe GroupMe::Messages do

  before do
    @client = GroupMe::Client.new(:token => "TEST")
  end

  describe ".message_count" do

    it "returns the number of messages for a group" do
      stub_get("/groups/1/messages").to_return(json_response("messages.json"))
      expect(@client.message_count(1)).to eq(123)
    end

  end

  describe ".messages" do

    it "returns messages for a group" do
      stub_get("/groups/1/messages").to_return(json_response("messages.json"))
      messages = @client.messages(1)
      expect(messages.first.text).to eq("Hello world")
    end

  end

  describe ".create_message" do

    it "sends a text only message to a group" do
      message = {
        :message => {
          :source_guid => "GUID",
          :text => "Hello world",
        }
      }
      stub_post("/groups/1/messages", message).to_return(json_response("message.json"))
      message = @client.create_message(1, "Hello world")
      expect(message.text).to eq("Hello world")
    end

  end

end