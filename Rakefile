require "bundler/gem_tasks"
require 'rake/testtask'


Rake::TestTask.new do |t|
    t.libs << 'lib/dweet'
    t.test_files = FileList['test/lib/dweet/test_*.rb']
    t.verbose = true
end
