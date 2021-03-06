require './spec/cases/helper'
STDOUT.sync = true # otherwise results can go weird...

results = []

[{in_processes: 2}, {in_threads: 2}, {in_threads: 0}].each do |options|
  x = [nil,nil,nil,nil,nil,nil,nil,nil]
  results << Parallel.all?(x, options) do |x|
    x.nil?
  end

  x = [42,42,42,42,42,42,42,42,42,42,42]
  results << Parallel.all?(x, options) do |x|
    x == 42
  end

  # Empty array should return true
  x = []
  results << Parallel.all?(x, options) do |x|
    x
  end
end

print results.join(',')
