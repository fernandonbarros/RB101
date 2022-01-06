def char_in_blocks?(chr, blocks)
  blocks.each {|block| return block if block.include?(chr)}
  false
end

def block_word?(word)
  blocks = %w(B:O X:K D:Q C:P N:A G:T R:E F:S J:W H:U V:I L:Y Z:M)
  word.upcase.chars.each do |chr|
    block_to_delete = char_in_blocks?(chr, blocks)
    if block_to_delete
      blocks.delete(block_to_delete)
    else
      return false
    end
  end
  true
end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

# After reviewing solution
def block_word?(word)
  up_word = word.upcase
  BLOCKS.none? { |block| up_word.count(block) >= 2 }
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
