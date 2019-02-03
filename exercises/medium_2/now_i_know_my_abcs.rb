def block_word?(word)
  remaining_blocks = [["B", "O"], ["G", "T"], ["V", "I"], ["X", "K"], ["R", "E"], ["L", "Y"], ["D", "Q"], ["F", "S"], ["Z", "M"], ["C", "P"], ["J", "W"], ["N", "A"], ["H", "U"]]
  
  word.upcase.each_char do |letter|
    initial_remaining_blocks_size = remaining_blocks.size
    
    remaining_blocks.each_with_index do |block, idx|
      if block.include?(letter)
        remaining_blocks.delete_at(idx)
        break
      end
    end
    
    return false if remaining_blocks.size == initial_remaining_blocks_size
  end
  true
end

# Given solution
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(word)
  word = word.upcase
  BLOCKS.none? { |block| word.count(block) >= 2 }
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true

