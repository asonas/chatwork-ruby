RSpec::Matchers.define :match_example do |verb, resource, status = 200|
  match do |actual|
    expected_example = RamlParser.find_response_example(verb, resource, status)
    raise "Not found '#{verb.to_s.upcase} #{resource} #{status}' in '#{schema_file}'" unless expected_example

    actual == expected_example
  end

  description do
    expected_example = RamlParser.find_response_example(verb, resource, status)
    "match #{expected_example}"
  end
end
