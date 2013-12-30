# Chatwork

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'chatwork'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chatwork

## Usage

```
require "chatwork"

# Create message
ChatWork.api_key = "XXX"
ChatWork::Message.create(room_id: 1234, body: "Hello, ChatWork!")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
