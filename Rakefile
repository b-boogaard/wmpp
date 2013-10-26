task :build, [:wmpp] => [:translate]
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

## REPL Run Tasks ##
task :run_calc do
	ruby "src/main_calc.rb"
end

## Translate Run Task ##
task :translate do
	ruby "src/main_compile.rb #{ARGV[1]}"
	j = ARGV[1].split("/")
	j = j[j.length - 1]
	j = j.split(".")
	j = j[0]
	j += ".j"
	dir = Dir.getwd
	sys = "java -jar jasmin.jar -d bin '#{dir}/j/#{j}'"
	puts sys
	system(sys)
end
