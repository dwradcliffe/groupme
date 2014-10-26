# encoding: utf-8

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
      expect(messages.first.text).to eq("Hello world ☃☃")
    end

  end

  describe ".create_message" do

    before do
      Timecop.freeze(Time.new(2014, 10, 25, 22, 33, 44, 0000))
    end

    after do
      Timecop.return
    end

    it "sends a text only message to a group" do
      message = {
        :message => {
          :source_guid => '2014-10-25 22:33:44 +0000',
          :text => "Hello world ☃☃",
        }
      }
      stub_post("/groups/1/messages", message).to_return(json_response("message.json", 201))
      message = @client.create_message(1, "Hello world ☃☃")
      expect(message.text).to eq("Hello world ☃☃")
    end

    it "sends a message with location to a group" do
      message = {
        :message => {
          :source_guid => '2014-10-25 22:33:44 +0000',
          :text => "Hello world ☃☃",
          :attachments => [
            {
              :type => "location",
              :lat => "40.738206",
              :lng => "-73.993285",
              :name => "GroupMe HQ"
            }
          ]
        }
      }
      stub_post("/groups/1/messages", message).to_return(json_response("message_with_location.json", 201))

      att = { :type => "location", :lat => "40.738206", :lng => "-73.993285", :name => "GroupMe HQ" }
      message = @client.create_message(1, "Hello world ☃☃", [att])
      expect(message.text).to eq("Hello world ☃☃")
      expect(message.attachments.count).to eq(1)
      expect(message.attachments.first.type).to eq("location")
      expect(message.attachments.first.lat).to eq("40.738206")
      expect(message.attachments.first.lng).to eq("-73.993285")
    end

  end

end
