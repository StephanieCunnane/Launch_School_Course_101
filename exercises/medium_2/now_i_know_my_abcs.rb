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

BLOCKS = Hash['b', 'o', 'o', 'b', 'g', 't', 't', 'g', 'v', 'i', 'i', 'v', 'x', 'k', 'k', 'x', 'r', 'e', 'e', 'r', 'l', 'y', 'y', 'l', 'd', 'q', 'q', 'd', 'f', 's', 's', 'f', 'z', 'm', 'm', 'z', 'c', 'p', 'p', 'c', 'j', 'w', 'w', 'j', 'n', 'a', 'a', 'n', 'h', 'u', 'u', 'h'].freeze

def block_word?(word)
  word = word.downcase
  available_letters = ('a'..'z').to_a

  word.each_char do |char|
    return false unless available_letters.include?(char) && available_letters.include?(BLOCKS[char])
    available_letters.delete(char).delete(BLOCKS[char])
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

