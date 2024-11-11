dictionary = File.new('google-10000-english-no-swears.txt', 'r')

def get_random_word(dictionary)
  all_words = []
  contents.each do |word|
    clean_word = word.to_s.chomp
    all_words << clean_word
  end
  all_words.sample
end

p get_random_word(dictionary)
