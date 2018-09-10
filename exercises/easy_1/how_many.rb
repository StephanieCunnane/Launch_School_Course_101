# Input: array
# Output: strings output to stdout on separate lines
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
            'motorcycle', 'car', 'truck']

def count_occurrences(vehicles)
  frequency_hash = {}
  vehicles.each do |vehicle|
    if frequency_hash[vehicle]
      frequency_hash[vehicle] += 1
    else
      frequency_hash[vehicle] = 1
    end
  end
  print_occurrences(frequency_hash)
end

def print_occurrences(frequency_hash)
  frequency_hash.each { |k, v| puts "#{k} => #{v}" }
end

count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
