RSpec.shared_examples :a_chatwork_api do
  let(:verb)     { raise "verb is required" }
  let(:resource) { raise "resource is required" }
  let(:status)   { 200 }

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
