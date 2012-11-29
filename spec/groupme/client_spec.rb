require 'spec_helper'

describe Groupme::Client do

  it "requires an access token" do
    expect{ Groupme::Client.new }.to raise_error(ArgumentError)
  end

end