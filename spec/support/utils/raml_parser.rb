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

  def self.find_node(elements)
    elements = Array(elements)
    raml.dig(*elements)
  end
  private_class_method :find_node

  def self.raml
    @raml ||= YAML.load_file(spec_dir.join("../schema/api-ja.raml"))
  end
  private_class_method :raml
end
