def greetings(name, job)
  puts "=> Hello, #{name.join(' ')}! " +  
  "Nice to have a #{job[:title]} #{job[:occupation]} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
