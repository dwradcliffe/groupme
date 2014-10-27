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

  describe ".create_group" do

    it "creates a group" do
      stub_post("/groups", :name => "Family").to_return(json_response("group.json"))
      group = @client.create_group("Family")
      expect(group.name).to eq("Family")
    end

  end

  describe ".update_group" do

    it "updates a group after creation" do
      data = {
        :name => "Family",
        :share => true,
        :image_url => "http://i.groupme.com/123456789"
      }
      stub_post("/groups/4321/update", data).to_return(json_response("updated_group.json"))
      group = @client.update_group(4321, data)
      expect(group.name).to eq("Family")
      expect(group.share_url).to eq("https://groupme.com/join_group/1234567890/SHARE_TOKEN")
    end

  end

  describe ".destroy_group" do

    it "disbands a group" do
      stub_post("/groups/4/destroy").to_return(:status => 200)
      response = @client.destroy_group(4)
      expect(response).to eq(true)
    end

  end

  describe ".join_group" do

    it "joins a shared group" do
      stub_post("/groups/4/join/1234asdf").to_return(:status => 200)
      response = @client.join_group(4, '1234asdf')
      expect(response).to eq(true)
    end

  end

end