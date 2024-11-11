require_relative('lib/game')

dictionary = File.new('google-10000-english-no-swears.txt', 'r')

game = Game.new
p random_word = game.get_random_word(dictionary)
while game.remaining_guesses.positive?

  if game.correct_guesses.join('') == random_word
    puts 'you win!'
    puts "the word was: #{random_word}"
    exit
  else
    puts 'Guess a letter'
    letter = gets.chomp.downcase
    game.check_guess(letter, random_word)
  end
end
puts 'Game over. No more guesses remaining'
