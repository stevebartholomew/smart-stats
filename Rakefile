require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.test_files = FileList['tests/**/*_test.rb']
  t.verbose = false
end

RuboCop::RakeTask.new

task default: ['test']
