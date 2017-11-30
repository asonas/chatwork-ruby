# ChatWork

Ruby bindings of ChatWork API

[![Gem Version](https://badge.fury.io/rb/chatwork.svg)](https://badge.fury.io/rb/chatwork)
[![Build Status](https://travis-ci.org/asonas/chatwork-ruby.svg?branch=master)](https://travis-ci.org/asonas/chatwork-ruby)
[![Coverage Status](https://coveralls.io/repos/github/asonas/chatwork-ruby/badge.svg?branch=master)](https://coveralls.io/github/asonas/chatwork-ruby)

## Installation

Add this line to your application's Gemfile:

    gem 'chatwork'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chatwork

## Usage

### Case 1. with API Key

``` ruby
require "chatwork"

# Create message
ChatWork.api_key = "XXX"
ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
```

or

``` sh
$ cat send_message.rb
require "chatwork"

ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
$ CHATWORK_API_TOKEN=xxx ruby send_message.rb
```

### Case 2. with OAuth access token
``` ruby
require "chatwork"

# Create message
ChatWork.access_token = "XXX"
ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
```

or

``` sh
$ cat send_message_with_access_token.rb
require "chatwork"

ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
$ CHATWORK_ACCESS_TOKEN=xxx ruby send_message_with_access_token.rb
```

### Case 3. Refresh access token with refresh token
``` ruby
require "chatwork"

ChatWork.client_id = "XXX"
ChatWork.client_secret = "XXX"
refresh_token = "XXX"
token = ChatWork::Token.refresh_access_token(refresh_token)
new_access_token = token["access_token"]

# Create message
ChatWork.access_token = new_access_token
ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
```

or

``` sh
$ cat refresh_access_token.rb
require "chatwork"

token = ChatWork::Token.refresh_access_token(ENV["REFRESH_TOKEN"])
new_access_token = token["access_token"]

# Create message
ChatWork.access_token = new_access_token
ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
$ CHATWORK_CLIENT_ID=xxx CHATWORK_CLIENT_SECRET=xxx REFRESH_TOKEN=xxx ruby refresh_access_token.rb
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
