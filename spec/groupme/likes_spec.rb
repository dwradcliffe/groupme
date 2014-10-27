require 'spec_helper'

describe GroupMe::Likes do

  before do
    @client = GroupMe::Client.new(:token => 'TEST')
  end

  describe '.create_like' do

    it 'likes a message' do
      stub_post('/messages/3/5/like').to_return(:status => 200)
      response = @client.create_like(3, 5)
      expect(response).to eq(true)
    end

  end

  describe '.destroy_like' do

    it 'likes a message' do
      stub_post('/messages/234/8/unlike').to_return(:status => 200)
      response = @client.destroy_like(234, 8)
      expect(response).to eq(true)
    end

  end

end