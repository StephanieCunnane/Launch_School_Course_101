#def print_in_box(text)
#  puts "+-#{'-' * text.size}-+"
#  puts "| #{' ' * text.size} |"
#  puts "| #{text} |"
#  puts "| #{' ' * text.size} |"
#  puts "+-#{'-' * text.size}-+"
#end

def print_in_box(text, terminal_width=80)
  line_width = terminal_width - 4
  text = text[0...line_width] if text.size > line_width
  puts "+-#{'-' * text.size}-+"
  puts "| #{' ' * text.size} |"
  puts "| #{text} |"
  puts "| #{' ' * text.size} |"
  puts "+-#{'-' * text.size}-+"
end

print_in_box('To boldly go where no one has gone before.')
#+--------------------------------------------+
#|                                            |
#| To boldly go where no one has gone before. |
#|                                            |
#+--------------------------------------------+

print_in_box('')
#+--+
#|  |
#|  |
#|  |
#+--+

print_in_box('NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNxNssssssssssssss88s')