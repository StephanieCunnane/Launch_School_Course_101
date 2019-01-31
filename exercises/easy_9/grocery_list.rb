def buy_fruit(grocery_list)
  results = []
  grocery_list.each do |fruit, quantity|
    quantity.times { results << fruit }
  end
  results
end

# refactor to use Array#map
def buy_fruit(grocery_list)
  grocery_list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

