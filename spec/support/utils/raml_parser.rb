module RamlParser
  def self.find_resource(verb, path)
    elements = path.split("/").reject(&:empty?).map { |str| "/#{str}" }
    elements << verb.to_s.upcase
    find_node(elements)
  end

  def self.find_response_example(verb, path, status = 200)
    resource = find_resource(verb, path)
    return nil unless resource

    response_json = resource.dig("responses", status, "body", "application/json", "example")
    return JSON.parse(response_json) if response_json

    return nil unless resource["is"]

    resource["is"].each do |trait_name|
      trait = find_trait(trait_name)
      next unless trait

      response_json = trait.dig("responses", status, "body", "application/json", "example")
      return JSON.parse(response_json) if response_json
    end

    nil
  end

  def self.find_trait(trait_name)
    traits = find_node("traits")
    traits.each do |trait|
      return trait.first.last if trait.first.first == trait_name
    end
    nil
  end

  def self.find_query_parameter_example(verb, path)
    resource = find_resource(verb, path)
    return {} unless resource

    parameter_example = {}

    if resource["queryParameters"]
      resource["queryParameters"].each do |name, value|
        parameter_example[name] = value["example"]
      end
    end

    if resource["is"]
      resource["is"].each do |trait_name|
        trait = find_trait(trait_name)
        next unless trait
        next unless trait["queryParameters"]

        trait["queryParameters"].each do |name, value|
          parameter_example[name] = value["example"]
        end
      end
    end

    parameter_example
  end

  def self.find_node(elements)
    elements = Array(elements)
    raml.dig(*elements)
  end
  private_class_method :find_node

  def self.raml
    return @raml if @raml

    yaml_data = schema_file.read

    # e.g. example: 123,542,1001 -> example: '123,542,1001'
    yaml_data.gsub!(/example: ([0-9,]+)/) { "example: '#{Regexp.last_match(1)}'" }

    @raml = YAML.safe_load(yaml_data)
  end
end
