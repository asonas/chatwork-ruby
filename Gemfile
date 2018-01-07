source "https://rubygems.org"

# Specify your gem's dependencies in chatwork.gemspec
gemspec

if Gem::Version.create(RUBY_VERSION) < Gem::Version.create("2.3.0")
  gem "backport_dig"
end

if Gem::Version.create(RUBY_VERSION) < Gem::Version.create("2.2.2")
  gem "activesupport", "< 5.0.0"
end
