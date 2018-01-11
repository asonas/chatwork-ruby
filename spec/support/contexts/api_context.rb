RSpec.shared_context :api_context, type: :api do
  let(:api_key) { "api_key" }

  let(:response_headers) do
    {
      "Content-Type"          => "application/json",
      "X-RateLimit-Limit"     => ratelimit_limit,
      "X-RateLimit-Remaining" => ratelimit_remaining,
      "X-RateLimit-Reset"     => ratelimit_reset,
    }
  end

  let(:ratelimit_limit)     { 100 }
  let(:ratelimit_remaining) { 44 }
  let(:ratelimit_reset)     { 1_390_941_626 }

  before do
    allow(ChatWork).to receive(:api_key) { api_key }
  end

  def stub_chatwork_request(expected_verb, expected_path, resource_path = nil, status = 200)
    resource_path ||= expected_path
    example = RamlParser.find_response_example(expected_verb, resource_path, status)
    raise "Not found '#{expected_verb.to_s.upcase} #{resource_path} #{status}' in '#{schema_file}'" unless example

    request_options = { headers: { "X-Chatworktoken" => api_key } }

    query_example = RamlParser.find_query_parameter_example(expected_verb, resource_path)
    unless query_example.empty?
      case expected_verb
      when :get, :delete
        query_string = "?" + query_example.to_query
      when :post, :put
        request_options[:headers]["Content-Type"] = "application/x-www-form-urlencoded"
        request_options[:body] = query_example
      end
    end

    stub_request(expected_verb, "https://api.chatwork.com/v2#{expected_path}#{query_string}").
      with(request_options).
      to_return(status: status, body: example.to_json, headers: response_headers)
  end
end
