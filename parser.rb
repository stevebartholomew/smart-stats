lib = File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH.unshift(lib)

require 'reports/total_visits'
require 'reports/unique_visits'

total = { }
unique = { }

# Rough objects
# log file
# log entry
# - page
# - ip

# report
# - name
# entry
# - page
# - total
#
# total visits report
# unique visits report
#
# cli renderer
#
#
# Log Entries => Report => Renderer

all_entries = File.open(ARGV[0], 'r').map {|line| line.split(/\s/) }

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

