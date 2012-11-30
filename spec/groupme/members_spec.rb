require 'spec_helper'

describe GroupMe::Members do

  before do
    @client = GroupMe::Client.new(:token => "TEST")
  end

  describe ".add_member" do

    it "adds a single member to a group" do
      member = {
        :nickname => "Mom",
        :user_id => "1234567890",
        :guid => "SOME_GUID"
      }
      stub_post("/groups/1/members/add", [member]).to_return(:status => 202)
      response = @client.add_member(1, member)
      expect(response).to eq(true)
    end

  end

  describe ".add_members" do

    it "adds a list of members to a group" do
      members = [{
        :nickname => "Mom",
        :user_id => "1234567890",
        :guid => "SOME_GUID"
      },{
        :nickname => "Dad",
        :phone_number => "+1 2123001234",
        :guid => "SOME_GUID"
      },{
        :nickname => "Jane",
        :email => "jane@example.com",
        :guid => "SOME_GUID"
      }]
      stub_post("/groups/1/members/add", members).to_return(:status => 202)
      response = @client.add_members(1, members)
      expect(response).to eq(true)
    end

  end

end