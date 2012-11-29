require 'spec_helper'

describe GroupMe::Groups do

  before do
    @client = GroupMe::Client.new(:token => "TEST")
  end

  describe ".groups" do

    it "returns user's groups" do
      stub_get("/groups").to_return(json_response("groups.json"))
      groups = @client.groups
      expect(groups.first.name).to eq("Family")
    end

  end

  describe ".group" do

    it "returns the matching group" do
      stub_get("/groups/1234567890").to_return(json_response("group.json"))
      group = @client.group(1234567890)
      expect(group.name).to eq("Family")
    end

  end

  describe ".former_groups" do

    it "returns user's former groups" do
      stub_get("/groups/former").to_return(json_response("former_groups.json"))
      groups = @client.former_groups
      expect(groups.first.name).to eq("Previous Family")
    end

  end

end