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

File.open(ARGV[0], 'r').each do |line|
  (url, ip) = line.split(/\s/)

  total[url] ||= 0
  total[url] += 1

  unique[url] ||= {}
  unique[url][ip] ||= 0
  unique[url][ip] += 1
end

total = total.sort_by {|(ip,t)| t}.reverse

puts '[Total visits by page]'
puts ''
total.each do |page, result|
  printf "%-8s %s\n", page, result
end

puts ''
puts '[Unique visits by page]'
puts ''

uniq_totals = unique.reduce({}) do |memo, (page, result)|
  t = result.reduce(0) do |acc, (ip, count)|
    acc += 1
    acc
  end

  memo[page] = t
  memo
end.sort_by {|k,t| t}.reverse

uniq_totals.each do |page, result|
  printf "%-8s %s\n", page, result
end
