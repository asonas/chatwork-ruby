if ENV["CI"]
  require "simplecov"
  require "coveralls"

  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  SimpleCov.start do
    %w[spec].each do |ignore_path|
      add_filter(ignore_path)
    end
  end
end

$LOAD_PATH << File.expand_path(File.join("..", "..", "lib"), __FILE__)

require "chatwork"

require "rspec-parameterized"
require "rspec/its"
require "webmock/rspec"
require "active_support/all"

begin
  require "backport_dig"
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

Dir["#{__dir__}/support/**/*.rb"].each {|f| require f }

def spec_dir
  Pathname(__dir__)
end

def schema_file
  spec_dir.join("../api/RAML/api-ja.raml")
end

RSpec.configure do |config|
  config.before(:suite) do
    raise "Not found '#{schema_file}'. Please run `git submodule update --init` at first" unless schema_file.exist?
  end
end
