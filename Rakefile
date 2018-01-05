require "bundler/gem_tasks"

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
  task :default => :spec
rescue
  $stderr.puts('Install rspec')
end
