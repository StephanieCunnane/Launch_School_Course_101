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

TERMINAL_WIDTH = 80

def print_in_box(phrase)
  line_width = TERMINAL_WIDTH - 4
  phrase = phrase[0...line_width] if phrase.size > line_width

  outer_line = "+#{'-' * (phrase.size + 2)}+"
  inner_line = "|#{' ' * (phrase.size + 2)}|"

  puts outer_line
  puts inner_line
  puts "| #{phrase} |"
  puts inner_line
  puts outer_line
end
