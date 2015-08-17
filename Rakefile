require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :test => [:spec, :rubocop]
task :default => :test

require 'rubocop/rake_task'
desc 'Execute rubocop'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.fail_on_error = true
end

namespace :doc do
  require 'yard'
  YARD::Rake::YardocTask.new do |task|
    task.files   = ['README.md', 'LICENSE.md', 'lib/**/*.rb']
    task.options = [
      '--output-dir', 'doc/yard',
      '--markup', 'markdown'
    ]
  end
end
