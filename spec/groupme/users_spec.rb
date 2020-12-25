require 'spec_helper'

describe GroupMe::Users do

  before do
    @client = GroupMe::Client.new(:token => 'TEST')
  end

  describe '.me' do

    it 'gets details about the authenticated user' do
      stub_get('users/me').to_return(json_response('user.json'))
      response = @client.me
      expect(response.name).to eq('Ronald Swanson')
    end

  end

end
