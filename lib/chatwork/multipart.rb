module ChatWork
  class Multipart < ::Faraday::Request::Multipart
    self.mime_type = "multipart/form-data".freeze

    def create_multipart(env, params)
      original_body = super(env, params)

      # replace from Faraday::Parts::EpiloguePart to ChatWork::Multipart::EpiloguePart
      parts = original_body.instance_variable_get(:@parts)
      parts.pop
      parts << EpiloguePart.new(env.request.boundary)

      new_body = ::Faraday::CompositeReadIO.new(*parts)
      env.request_headers[Faraday::Env::ContentLength] = new_body.length.to_s
      new_body
    end
  end

  class EpiloguePart < ::Faraday::Parts::EpiloguePart
    def initialize(boundary)
      # NOTE: ChatWork doesn't accepts ending "\r\n\r\n" of payload...
      # @part = "--#{boundary}--\r\n\r\n"
      @part = "--#{boundary}--\r\n"
      @io = StringIO.new(@part)
    end
  end
end
