if __FILE__ == $PROGRAM_NAME
	puts "when in app.rb, it returns #{__FILE__} and #{$PROGRAM_NAME}"
	# make a hash of words
	@word_hash = {}
	dictionary = File.open('1000_families.txt', 'r')
	dictionary.each do |word|
		word = word.strip.downcase
		@word_hash[word] = true
	end
	dictionary.close

	# create a list of long words to choose
	# a game word from!
	long_word_list = []
	@word_hash.select do |k, v|
		if k.length > 7
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
@valid_guesses = []
def is_valid_guess?(player_word)
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
def all_possible_anagrams_of_game_word(game_word)
	@official_guess_list = []
	@word_hash.each_key do |k|
		word_split_and_sorted = k.split("").sort
		if rule1(word_split_and_sorted, game_word) && rule2(word_split_and_sorted, game_word) \
			&& rule3(word_split_and_sorted)
			@official_guess_list.push(k)
		end
	end
end

# play the game
all_possible_anagrams_of_game_word(game_word)
puts @official_guess_list.length
puts "here is the official list"
puts "-------------------------"
print @official_guess_list
puts "\n-------------------------"

while @official_guess_list.length != @valid_guesses.length
	# get player word, recombobulate it into a sorted string
	player_word_string = $stdin.gets.chomp.downcase
	player_word = player_word_string.split("").sort

	if already_guessed?(player_word_string) == false
		puts "You've already guessed that word!"	
	elsif @official_guess_list.include?(player_word_string)
		is_valid_guess?(player_word_string)
		puts "woo that's an actual word on the list!"
	else
		puts "That is not a valid word. Keep trying ok!"
	end
	puts @valid_guesses.length
end








