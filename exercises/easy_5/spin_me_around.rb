def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

phrase = "hello world"
p "object_id of the argument to the method: #{phrase.object_id}"
p "object_id of the return value of the spin_me method: #{spin_me(phrase).object_id}"
