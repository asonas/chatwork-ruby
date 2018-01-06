RSpec.shared_examples :a_chatwork_api do |verb, resource, status = 200|
  it { should match_example(verb, resource, status) }

  it "works with block" do
    subject do |body, headers|
      aggregate_failures do
        expect(body).to match_example(verb, resource, status)
        expect(headers).to eq response_headers
      end
    end
  end
end
