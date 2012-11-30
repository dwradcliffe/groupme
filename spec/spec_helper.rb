require 'groupme'
require 'webmock/rspec'

def stub_get(url)
  stub_request(:get, "https://api.groupme.com/v3#{url}").with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>GroupMe::USER_AGENT})
end

def stub_post(url, data)
  stub_request(:post, "https://api.groupme.com/v3#{url}")
    .with(:headers => {'Accept'=>'*/*', 'User-Agent'=>GroupMe::USER_AGENT, 'Content-Type'=>'application/json'})
    .with(:body => JSON.dump(data))
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  WebMock::Util::JSON.parse(File.read(fixture_path + '/' + file))
end

def json_response(file)
  {
    :body => {
      :response => fixture(file),
      :meta => {
        :code => 200,
        :errors => []
      }
    },
    :headers => {
      :content_type => 'application/json; charset=utf-8'
    }
  }
end