#

if ENV["CI"]
  require 'coveralls'
  Coveralls.wear!
end

$LOAD_PATH << File.expand_path(File.join('..', '..', 'lib'), __FILE__)

require 'chatwork'

require 'rspec/its'
require "webmock/rspec"
require "pry"

begin
  require "backport_dig"
rescue LoadError
end

Dir["#{__dir__}/support/**/*.rb"].each { |f| require f }

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
