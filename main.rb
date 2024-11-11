dictionary = File.new('google-10000-english-no-swears.txt', 'r')

def get_random_word(dictionary)
  all_words = []
  dictionary.each do |word|
    clean_word = word.to_s.chomp
    all_words << clean_word if clean_word.length >= 5 && clean_word.length <= 12
  end
  all_words.sample
end

p get_random_word(dictionary)
