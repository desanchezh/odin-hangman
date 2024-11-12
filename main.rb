require_relative('lib/game')
require 'yaml'

dictionary = File.new('google-10000-english-no-swears.txt', 'r')

def save_game(game)
  serialized_object = YAML.dump(game)
  Dir.mkdir('saves') unless Dir.exist?('saves')

  filename = "saves/hangman_#{game.correct_guesses.join('')}.YAML"

  File.open(filename, 'w') do |file|
    file.write(serialized_object)
  end
end

def load_game # how to stop user from seeing answer in save file?
  puts 'paste your savefile link here (relative path)'
  filename = gets.chomp.to_s
  YAML.unsafe_load File.read(filename)
end

puts 'Start a new game or load a save? (new/load)'
answer = gets.chomp
if answer == 'load'
  game = load_game
elsif answer == 'new'
  game = Hangman.new(dictionary)
end

while game.remaining_guesses.positive?
  if game.correct_guesses.join('') == game.random_word
    puts 'you win!'
    puts "the word was: #{game.random_word}"
    exit
  else
    puts 'save game (y/n)?'
    save = gets.chomp
    save_game(game) if save == 'y'
    puts 'Guess a letter'
    letter = gets.chomp.downcase
    game.check_guess(letter, game.random_word)
  end
end
puts 'game over. no more guesses remaining'
puts "the word was: #{game.random_word}"
