require 'english'
require 'log_file/parsers'

class LogFile
  attr_accessor :path, :entries, :errors

  # @param path [String] file path to log file
  def initialize(path)
    @path = path
    @entries = []
    @errors = []
  end

  def parse
    File.foreach(path) do |line|
      next if line =~ /^$/
      line.chomp!

      (path, ip) = Parsers.line(line)

      if path && ip
        entries << [path, ip]
      else
        errors << [$INPUT_LINE_NUMBER, line]
      end
    end

    [entries, errors]
  end
end
