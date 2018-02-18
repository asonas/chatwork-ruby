module ChatWork::Client::MeMethods
  # Get your account information
  #
  # @see http://developer.chatwork.com/ja/endpoint_me.html#GET-me
  # @see http://download.chatwork.com/ChatWork_API_Documentation.pdf
  #
  # @yield [response_body, response_header] if block was given, return response body and response header through block arguments
  # @yieldparam response_body [Hashie::Mash] response body
  # @yieldparam response_header [Hash<String, String>] response header (e.g. X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset)
  #
  # @return [Hashie::Mash]
  #
  # @example response format
  #   {
  #     "account_id": 123,
  #     "room_id": 322,
  #     "name": "John Smith",
  #     "chatwork_id": "tarochatworkid",
  #     "organization_id": 101,
  #     "organization_name": "Hello Company",
  #     "department": "Marketing",
  #     "title": "CMO",
  #     "url": "http://mycompany.example.com",
  #     "introduction": "Self Introduction",
  #     "mail": "taro@example.com",
  #     "tel_organization": "XXX-XXXX-XXXX",
  #     "tel_extension": "YYY-YYYY-YYYY",
  #     "tel_mobile": "ZZZ-ZZZZ-ZZZZ",
  #     "skype": "myskype_id",
  #     "facebook": "myfacebook_id",
  #     "twitter": "mytwitter_id",
  #     "avatar_image_url": "https://example.com/abc.png",
  #     "login_mail": "account@example.com"
  #   }
  def get_me(&block)
    get("/me", &block)
  end
end
