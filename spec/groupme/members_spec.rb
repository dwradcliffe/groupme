require 'spec_helper'

describe GroupMe::Members do

  before do
    @client = GroupMe::Client.new(:token => 'TEST')
  end

  describe '.add_member' do

    it 'adds a single member to a group' do
      member = {
        :nickname => 'Mom',
        :user_id => '1234567890',
        :guid => 'SOME_GUID'
      }
      stub_post('groups/1/members/add', [member]).to_return(:status => 202)
      response = @client.add_member(1, member)
      expect(response).to eq(true)
    end

  end

  describe '.membership_results' do

    it 'lists membership results from an add call' do
      stub_get('groups/123/members/results/456').to_return(json_response('members.json'))
      response = @client.membership_results(123, 456)
      expect(response.length).to eq(2)
      expect(response.first.nickname).to eq('John')
      expect(response.last.guid).to eq('GUID-2')
    end

  end

  describe '.add_members' do

    it 'adds a list of members to a group' do
      members = [{
        :nickname => 'Mom',
        :user_id => '1234567890',
        :guid => 'SOME_GUID'
      }, {
        :nickname => 'Dad',
        :phone_number => '+1 2123001234',
        :guid => 'SOME_GUID'
      }, {
        :nickname => 'Jane',
        :email => 'jane@example.com',
        :guid => 'SOME_GUID'
      }]
      stub_post('groups/1/members/add', members).to_return(:status => 202)
      response = @client.add_members(1, members)
      expect(response).to eq(true)
    end

  end

  describe '.remove_member' do

    it 'removes a member from the group' do
      stub_post('groups/1/members/234/remove').to_return(:status => 200)
      response = @client.remove_member(1, 234)
      expect(response).to eq(true)
    end

  end

end
