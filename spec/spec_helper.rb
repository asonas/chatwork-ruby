# encoding: utf-8
#

if ENV["CI"]
  require 'coveralls'
  Coveralls.wear!
end

$: << File.expand_path(File.join(*%w{.. .. lib}), __FILE__)

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
