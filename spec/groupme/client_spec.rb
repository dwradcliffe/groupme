require 'spec_helper'

describe GroupMe::Client do

  it 'requires an access token' do
    expect { GroupMe::Client.new }.to raise_error(ArgumentError)
  end

end
