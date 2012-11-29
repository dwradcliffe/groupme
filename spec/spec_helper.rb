require 'groupme'
require 'webmock/rspec'

def stub_get(url)
  stub_request(:get, "https://api.groupme.com/v3#{url}").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>"groupme gem v#{Groupme::VERSION}"})
end

def stub_post(url)
  stub_request(:post, "https://api.groupme.com/v3#{url}").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>"groupme gem v#{Groupme::VERSION}"})
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def json_response(file)
  {
    :body => fixture(file),
    :headers => {
      :content_type => 'application/json; charset=utf-8'
    }
  }
end