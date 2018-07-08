require "bundler/gem_tasks"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new
  task :default => :spec
rescue
  warn("Install rspec")
end

desc "Update API schama"
task :update_api_schema do
  command = "git submodule foreach git pull origin master --ff"
  sh command
  sh "git add api"
  sh "git commit -m '#{command}'"
end
