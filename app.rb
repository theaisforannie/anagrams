if __FILE__ == $PROGRAM_NAME
	puts "when in app.rb, it returns #{__FILE__} and #{$PROGRAM_NAME}"
	# make a hash of words
	word_hash = {}
	sowpods = File.open('sowpods.txt', 'r')
	sowpods.each do |line|
		word_hash[line.chomp.downcase] = true
	end
	sowpods.close

	# create a list of long words to choose
	# a game word from!
	long_word_list = []
	word_hash.select do |k, v|
		if k.length > 8
			long_word_list.push(k)
		end
	end
	game_word = long_word_list.sample
	game_letters = game_word.split("")
	puts game_word
end

# Rule 1: Every letter in player_word
# appears in game_word
def rule1(player_word, game_word)
	is_valid = true
	player_word.each do |letter|
		if game_word.include?(letter) == false
			is_valid = false
			break
		else
		end
	end
	return is_valid
end

# Rule 2: Each unique letter in player_word may only appear
# in player_word less than or equal to the number of times
# the same letter appears in game_word
def rule2(player_word, game_word)
	is_valid = true
	player_word.uniq.each do |letter|
		if player_word.count(letter) > game_word.count(letter)
			is_valid = false
			break
		else
		end
	end
	return is_valid
end

# Rule 3: player_word must be greater than or equal to
# two letters long.
def rule3(player_word)
	is_valid = true
	if player_word.length < 2
		is_valid = false
	else
	end
	return is_valid
end

# if the player_word returned true for all three rules,
# add it to an array of the player's guesses
# and return true
def is_valid_guess?(player_word)
	@valid_guesses = []
	@valid_guesses.push(player_word)
	return true
end

# check if a word has already been guessed
def already_guessed?(player_word)
	is_valid = true
	if @valid_guesses.include?(player_word)
		is_valid = false
	end
	return is_valid
end

# creates a list of all possible anagrams in game_word
official_guess_list = []
word_hash.each_key do |k|
	k = k.split("").sort
	if rule1(k, game_word) && rule2(k, game_word) && rule3(k)
		official_guess_list.push(k)
	end
end

# get player word, recombobulate it into a sorted string
player_word = $stdin.gets.chomp
player_word = player_word.split("").sort
if rule1(player_word, game_word) && rule2(player_word, game_word) && rule3(player_word)
	puts "Yay! Good word"
	is_valid_guess?(player_word)
else
	puts "That is not a valid word. Whomp."
end
print @valid_guesses








