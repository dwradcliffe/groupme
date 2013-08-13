# groupme [![Build Status](https://secure.travis-ci.org/dwradcliffe/groupme.png?branch=master)](https://travis-ci.org/dwradcliffe/groupme) [![Dependency Status](https://gemnasium.com/dwradcliffe/groupme.png)](https://gemnasium.com/dwradcliffe/groupme) [![Code Climate](https://codeclimate.com/github/dwradcliffe/groupme.png)](https://codeclimate.com/github/dwradcliffe/groupme) [![Gem Version](https://badge.fury.io/rb/groupme.png)](http://badge.fury.io/rb/groupme)

Simple wrapper for the GroupMe v3 API.

## Installation

Add this line to your application's Gemfile:

    gem 'groupme'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install groupme

## Documentation
[http://rdoc.info/gems/groupme/frames/index][documentation]

[documentation]: http://rdoc.info/gems/groupme/frames/index

## Usage

You will need to start with a client object:

    @client = GroupMe::Client.new(:token => "TEST")
    
Then you can call any of the API methods on this object:

    groups = @client.groups
    new_group = @client.create_group("Family")
