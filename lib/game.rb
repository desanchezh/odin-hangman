# 7 tries
class Hangman
  def initialize(dictionary)
    puts 'game initialized'
    @incorrect_guesses = []
    @correct_guesses = []
    @remaining_guesses = 7
    @random_word = get_random_word(dictionary)
  end

  attr_reader :correct_guesses, :incorrect_guesses, :remaining_guesses, :random_word

  def get_random_word(dictionary)
    all_words = []
    dictionary.each do |word|
      clean_word = word.to_s.chomp
      all_words << clean_word if clean_word.length >= 5 && clean_word.length <= 12
    end
    all_words.sample
  end

  def save_game
    serialized_object = YAML.dump({
                                    incorrect_guesses: game.incorrect_guesses,
                                    correct_guesses: game.correct_guesses,
                                    remaining_guesses: game.remaining_guesses,
                                    random_word: game.random_word
                                  })
  end

  def check_guess(guess_letter, random_word)
    random_word_letters = random_word.split('')
    if !random_word_letters.include?(guess_letter)
      @incorrect_guesses << guess_letter
      @remaining_guesses -= 1
      puts "wrong. incorrect guesses so far: #{@incorrect_guesses.join(' ')}"
      puts "you have #{@remaining_guesses} guesses remaining"
      puts "letters found: #{@correct_guesses.join(' ')}"
    elsif random_word_letters.include?(guess_letter)
      random_word_letters.each_with_index do |random_letter, i|
        if random_letter == guess_letter
          correct_guesses[i] = random_letter
        elsif @correct_guesses[i].nil? || @correct_guesses[i] == '_'
          correct_guesses[i] = '_'
        else
          @correct_guesses[i]
        end
      end
      puts 'correct letter!'
      puts "letters found: #{@correct_guesses.join(' ')}"
    end
    @correct_guesses = correct_guesses
  end
end
