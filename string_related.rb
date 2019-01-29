
def group_anagram(test_words)
  test_words.group_by{|w| w.each_char.sort}.values
end

def group_anagram2(test_words)
  hsh = {}
  test_words.each do |word|
    hsh[word.each_char.sort] ||= []
    hsh[word.each_char.sort] += [word]
  end
  hsh.values

end



test_words = ['cars', 'cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']

puts group_anagram2(test_words).to_s