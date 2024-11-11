# 7 tries
class Game
  def initialize(dictionary)
    puts 'game initialized'
    @random_word = get_random_word(dictionary)
    @incorrect_guesses = []
    @correct_guesses = []
  end

  attr_reader :correct_guesses, :incorrect_guesses

  def get_random_word(dictionary)
    all_words = []
    dictionary.each do |word|
      clean_word = word.to_s.chomp
      all_words << clean_word if clean_word.length >= 5 && clean_word.length <= 12
      all_words.sample
    end
  end

  def check_guess(guess_letter, random_word)
    p random_word_letters = random_word.split('')
    @incorrect_guesses << guess_letter unless random_word_letters.include?(guess_letter)
    random_word_letters.each_with_index do |random_letter, i|
      @correct_guesses[i] = if random_letter == guess_letter
                              random_letter
                            else
                              '_'
                            end
    end
    @correct_guesses
  end
end
