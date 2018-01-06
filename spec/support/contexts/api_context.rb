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
  let(:ratelimit_reset)     { 1390941626 }

  before do
    allow(ChatWork).to receive(:api_key) { api_key }
  end

  def stub_chatwork_request(verb, path, resource, status = 200)
    example = RamlParser.find_response_example(verb, resource, status)
    raise "Not found '#{verb.to_s.upcase} #{resource} #{status}' in '#{schema_file}'" unless example

    stub_request(verb, "https://api.chatwork.com/v2#{path}").
      with(headers: { "X-Chatworktoken" => api_key }).
      to_return(status: status, body: example.to_json, headers: response_headers)
  end
end
