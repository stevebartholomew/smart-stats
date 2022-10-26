require 'log_file'
require 'reports/total_visits'
require 'reports/unique_visits'
require 'renderers/text'

class Cli
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def run!
    check_file_is_valid!

    (entries, errors) = LogFile.new(path).parse

    total_visits = Reports::TotalVisits.new(entries)
    unique_visits = Reports::UniqueVisits.new(entries)

    renderer = Renderers::Text.new(reports: [total_visits, unique_visits], errors: errors)
    puts renderer.render
  end

  private

  def check_file_is_valid!
    return if File.exist?(path) && !File.empty?(path)

    puts "#{path} is either missing or empty!"

    exit(1)
  end
end
