require 'rake'

task :default => [:buildall]
task :build, [:file] => [:translate]
task :run, [:argv] => [:prog]
task :tests => [:test]
task :brian_test => [:brian_tests]
task :sam_test => [:sam_tests]
task :calc => [:run_calc]

## Build All ##
task :buildall do
	Dir.foreach('wmpp/') do |item|
  		next if item == '.' or item == '..'
  		ruby "src/main_compile.rb wmpp/#{item}"
	end

	Dir.foreach('j/') do |item|
		next if item == '.' or item == '..'
		system("java -jar jasmin.jar -d bin j/#{item}")
	end
end

## Translate Run Task ##
task :translate, :file do |t, args|
	ruby "src/main_compile.rb #{args[:file]}"
	j = args[:file].split("/")
	j = j[j.length - 1]
	j = j.split(".")
	j = j[0]
	j += ".j"
	dir = Dir.getwd
	sys = "java -jar jasmin.jar -d bin '#{dir}/j/#{j}'"
	#puts sys
	sh sys
end

task :prog, :argv do |t, args|
	#puts "******** Running #{ARGV[1]} ********"
	#system("java -classpath bin/ #{ARGV[1]}")
	system("java -classpath bin/ #{args[:argv]}")
end

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
