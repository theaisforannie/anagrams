require './app.rb'

game_word = ["a", "b", "d", "e", "r"] # bread

beard_word = ["a", "b", "d", "e", "r"]
bears_word = ["a", "b", "e", "r", "s"] # will fail
beer_word = ["b", "e", "e", "r"] # will fail

if rule2(beer_word, game_word) == false # true
	puts "wheeeeeee"
else
	puts "whomp"
end
