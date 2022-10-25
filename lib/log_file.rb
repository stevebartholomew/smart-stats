require 'english'
require 'log_file/parsers'

class LogFile
  attr_reader :path, :entries, :errors

  # @param path [String] file path to log file
  def initialize(path)
    @path = path
    @entries = []
    @errors = []
  end

  # @raises [Error] if file is empty
  def parse!
    parse
  end

  private

  attr_writer :entries, :errors

  def parse
    File.foreach(path) do |line|
      next if line =~ /^$/
      line.chomp!

      (path, ip) = Parsers.line(line)

      if path && ip
        entries << [path, ip]
      else
        errors << ["line #{$INPUT_LINE_NUMBER}", line]
      end
    end

    [entries, errors]
  end
end
