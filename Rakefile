task :tests => [:test]
task :brian_test => [:brian_tests]
task :sam_test => [:sam_tests]
task :calc => [:run_calc]

## Testing Tasks ##
task :test do
	ruby "test/main_test_suite.rb"
end

task :brian_tests do
	ruby "test/brian_test_suite.rb"
end

task :sam_tests do
	ruby "test/sam_test_suite.rb"
end

## Main Run Tasks ##
task :run_calc do
	ruby "src/main_calc.rb"
end