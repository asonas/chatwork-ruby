lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "chatwork/version"

Gem::Specification.new do |spec|
  spec.name          = "chatwork"
  spec.version       = ChatWork::VERSION
  spec.authors       = ["asonas", "sue445"]
  spec.email         = ["hzw1258@gmail.com", "sue445@sue445.net"]
  spec.description   = "ChatWork is cloud-based business chat tool"
  spec.summary       = "Ruby bindings of ChatWork API"
  spec.homepage      = "https://github.com/asonas/chatwork-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9"

  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "onkcop", "0.52.1.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "rubocop", "0.52.1"
  spec.add_development_dependency "rubocop-rspec", "1.21.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "yard"
end
