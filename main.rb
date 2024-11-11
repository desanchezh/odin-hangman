require_relative('lib/game')

dictionary = File.new('google-10000-english-no-swears.txt', 'r')

game = Game.new(dictionary)

game.check_guess('a', 'random')

p game.correct_guesses
