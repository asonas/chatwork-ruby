# ChatWork

Ruby bindings of ChatWork API

[![Gem Version](https://badge.fury.io/rb/chatwork.svg)](https://badge.fury.io/rb/chatwork)
[![Build Status](https://github.com/asonas/chatwork-ruby/workflows/test/badge.svg?branch=master)](https://github.com/asonas/chatwork-ruby/actions?query=workflow%3Atest)
[![Coverage Status](https://coveralls.io/repos/github/asonas/chatwork-ruby/badge.svg?branch=master)](https://coveralls.io/github/asonas/chatwork-ruby)

## Installation

Add this line to your application's Gemfile:

    gem 'chatwork'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chatwork

## Usage
`chatwork` gem provides class method APIs and instance method APIs

### Class method APIs
At first, set `ChatWork.api_key` or `ChatWork.access_token`.

```ruby
ChatWork.api_key = "XXX"
# or
ChatWork.access_token = "XXX"
```

Another way, you can use `ENV["CHATWORK_API_TOKEN"]` or `ENV["CHATWORK_ACCESS_TOKEN"]` instead of `ChatWork.api_key` or `ChatWork.access_token`.

Then call class methods.

e.g. post message.

```ruby
ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
#=> #<Hashie::Mash message_id="1234567890">
```

All available APIs are followings.

* [ChatWork::Contacts](lib/chatwork/contacts.rb)
* [ChatWork::File](lib/chatwork/file.rb)
* [ChatWork::IncomingRequest](lib/chatwork/incoming_request.rb)
* [ChatWork::InvitationLink](lib/chatwork/invitation_link.rb)
* [ChatWork::Me](lib/chatwork/me.rb)
* [ChatWork::Member](lib/chatwork/member.rb)
* [ChatWork::Message](lib/chatwork/message.rb)
* [ChatWork::MyStatus](lib/chatwork/my_status.rb)
* [ChatWork::MyTask](lib/chatwork/my_task.rb)
* [ChatWork::Room](lib/chatwork/room.rb)
* [ChatWork::Task](lib/chatwork/task.rb)

When you want to refresh access token, call [`ChatWork::Token.refresh_access_token`](lib/chatwork/token.rb).

```ruby
ChatWork.client_id = "XXX"
ChatWork.client_secret = "XXX"
refresh_token = "XXX"
token = ChatWork::Token.refresh_access_token(refresh_token)
new_access_token = token["access_token"]

# Create message
ChatWork.access_token = new_access_token
ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
```

Another way, you can use `ENV["CHATWORK_CLIENT_ID"]` or `ENV["CHATWORK_CLIENT_SECRET"]` instead of `ChatWork.api_key` or `ChatWork.access_token`.

### Instance method APIs
```ruby
client = ChatWork::Client.new(api_key: "XXX")
#or
client = ChatWork::Client.new(access_token: "XXX")
```

Then call instance methods.

e.g. post message.

```ruby
client.create_message(room_id: 1234, body: "Hello, ChatWork!")
#=> #<Hashie::Mash message_id="1234567890">
```

All available APIs are followings.

http://www.rubydoc.info/gems/chatwork/ChatWork/Client

When you want to refresh access token, call [`ChatWork::OAuthClient#refresh_access_token`](lib/chatwork/oauth_client/token_methods.rb).

```ruby
refresh_token = "XXX"
oauth_client = ChatWork::OAuthClient.new(client_id: "xxx", client_secret: "xxx")
token = oauth_client.refresh_access_token(refresh_token)
new_access_token = token["access_token"]

# Create message
client = ChatWork::Client.new(access_token: new_access_token)
client.create_message(room_id: 1234, body: "Hello, ChatWork!")
```

### Pros/Cons
Class method APIs are simple, but **not threadsafe**. Instance method APIs are **threadsafe**.

If you are using multiple `api_key` or `access_token` in an app and using multithreaded server (e.g. [puma](https://github.com/puma/puma)), we recommend instance method APIs.

## Tips
### Hashie::Mash
All API methods returns `Hashie::Mash` instance.

https://github.com/intridea/hashie#mash

`Hashie::Mash` is very useful!

```ruby
body = ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
#=> #<Hashie::Mash message_id="1234567890">

body["message_id"]
#=> "1234567890"

body[:message_id]
#=> "1234567890"

body.message_id
#=> "1234567890"
```

### Block arguments
All API methods supports block argument.

If block was given, return response body and response header through block arguments.

```ruby
ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!") do |body, header|
  body
  #=> #<Hashie::Mash message_id="1234567890">

  header["X-RateLimit-Limit"]
  #=> "100"
  header["X-RateLimit-Remaining"]
  #=> "0"
  header["X-RateLimit-Reset"]
  #=> "1390941626"
end
```

```ruby
client.create_message(room_id: 1234, body: "Hello, ChatWork!") do |body, header|
  body
  #=> #<Hashie::Mash message_id="1234567890">

  header["X-RateLimit-Limit"]
  #=> "100"
  header["X-RateLimit-Remaining"]
  #=> "0"
  header["X-RateLimit-Reset"]
  #=> "1390941626"
end
```

## Reference
http://www.rubydoc.info/gems/chatwork

## Development
```bash
cp .env.example .env
vi .env

./bin/console
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
