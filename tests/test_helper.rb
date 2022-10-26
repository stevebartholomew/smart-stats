require 'minitest/autorun'
require 'ostruct'

root = File.join(File.dirname(__FILE__), '..')
lib = File.join(root, 'lib')
$LOAD_PATH.unshift(lib)

def fixture_path(path)
  File.join(File.dirname(__FILE__), 'fixtures', path)
end

def fixture(path)
  File.read(fixture_path(path))
end

def double(attrs)
  klass = Struct.new(*attrs.keys)
  klass.new(*attrs.values)
end
