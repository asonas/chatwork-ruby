RSpec.shared_examples :a_chatwork_api do |verb, resource, status = 200|
  context "without block" do
    let(:block) { nil }

    it { should match_example(verb, resource, status) }
  end

  context "with block" do
    let(:block) do
      ->(body, header) do
        @body = body
        @header = header
      end
    end

    it "works with block" do
      subject

      aggregate_failures do
        expect(@body).to match_example(verb, resource, status)

        expect(@header["Content-Type"]).to eq "application/json"
        expect(@header["X-RateLimit-Limit"]).to eq ratelimit_limit
        expect(@header["X-RateLimit-Remaining"]).to eq ratelimit_remaining
        expect(@header["X-RateLimit-Reset"]).to eq ratelimit_reset
      end
    end
  end
end
