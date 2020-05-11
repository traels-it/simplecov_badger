require "bundler/gem_tasks"
require "rake/testtask"

path = File.expand_path(__dir__)
Dir.glob("#{path}/lib/simplecov_badger/*.rake").each { |f| import f }

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test
