lib = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(lib)

require 'log_file'
require 'reports/total_visits'
require 'reports/unique_visits'

all_entries = LogFile.new(ARGV[0]).entries

total_visits = Reports::TotalVisits.new(all_entries)
unique_visits = Reports::UniqueVisits.new(all_entries)

puts '[Total visits by page]'
puts ''

total_visits.results.each do |result|
  printf "%-8s %s\n", result.page, result.count
end

puts ''
puts '[Unique visits by page]'
puts ''

unique_visits.results.each do |result|
  printf "%-8s %s\n", result.page, result.count
end

