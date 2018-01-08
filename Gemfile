source "https://rubygems.org"

# Specify your gem's dependencies in chatwork.gemspec
gemspec

if Gem::Version.create(RUBY_VERSION) < Gem::Version.create("2.3.0")
  group :test do
    gem "backport_dig", group: :development
  end
end

if Gem::Version.create(RUBY_VERSION) < Gem::Version.create("2.2.2")
  group :test do
    gem "activesupport", "< 5.0.0", group: :development
  end
end
