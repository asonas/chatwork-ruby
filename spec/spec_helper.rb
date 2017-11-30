# encoding: utf-8
#

if ENV["CI"]
  require 'coveralls'
  Coveralls.wear!
end

$: << File.expand_path(File.join(*%w{.. .. lib}), __FILE__)

require 'chatwork'

require 'rspec/its'
require_relative './shared_stubs'

