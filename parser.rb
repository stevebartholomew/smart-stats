lib = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(lib)

require 'cli'

Cli.new(ARGV[0]).run!
