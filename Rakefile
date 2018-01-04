require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
  task :default => :spec
rescue
  $stderr.puts('Install rspec')
end

desc "Update schema/api-ja.raml from https://github.com/chatwork/api"
task :update_schema do
  require "open-uri"

  schema_url = "https://raw.githubusercontent.com/chatwork/api/master/RAML/api-ja.raml"
  File.open("schema/api-ja.raml", "wb") do |f|
    f.write(open(schema_url).read)
  end
end
