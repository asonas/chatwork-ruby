lib = File.expand_path("lib", __dir__)
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

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 2.0.0"
  spec.add_dependency "faraday-mashify"

  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "bundler", ">= 1.3"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "faraday_curl"
  spec.add_development_dependency "onkcop", "0.53.0.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
  spec.add_development_dependency "rspec-parameterized"
  spec.add_development_dependency "rubocop", "0.53.0"
  spec.add_development_dependency "rubocop-rspec", "1.24.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "simplecov-lcov"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "yard"
end
