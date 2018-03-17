require "csv"

fn      = ARGV[0]
arrs    = CSV.parse(File.read(fn))
headers = arrs.shift
headers.unshift("id")

formatted = arrs.map do |a|
  t = a.first.split("-")
  a[0] = t
  a.flatten
end

formatted.unshift(headers)

output = CSV.generate do |csv|
  formatted.each { |r| csv << r }
end

puts output