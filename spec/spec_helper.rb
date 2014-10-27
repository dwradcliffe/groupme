require 'groupme'
require 'multi_json'
require 'webmock/rspec'
require 'timecop'

def stub_get(url)
  stub_request(:get, "https://api.groupme.com/v3#{url}")
end

def stub_post(url, data = {})
  stub_request(:post, "https://api.groupme.com/v3#{url}").with(:body => MultiJson.dump(data))
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  MultiJson.load(File.read(fixture_path + '/' + file))
end

def json_response(file, status = 200)
  {
    :status => status,
    :body => {
      :response => fixture(file),
      :meta => {
        :code => status,
        :errors => []
      }
    },
    :headers => {
      :content_type => 'application/json; charset=utf-8'
    }
  }
end
