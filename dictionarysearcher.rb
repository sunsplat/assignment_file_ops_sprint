
class DictionarySearcher

	def initialize(dictionary)
		@dictionary = dictionary
	end

	def prompt
		puts "Enter the search term"
		term = gets.chomp
		puts "What kind of search?"
		puts "1: Exact"
		puts "2: Partial"
		puts "3: Begins With"
		puts "4: Ends With"
		choice = gets.chomp.to_i
		
		if choice == 1
			exact_match(term)
		elsif choice == 2
			partial_match(term)
		elsif choice == 3
			begins_with_match(term)
		elsif choice == 4
			ends_with_match(term)
		else
			"Invalid selection"
			prompt
		end
	end

	def exact_match(term)
		matches = []
		@dictionary.each do |word|
			if word.downcase.chomp == term.downcase
				puts "#{word.chomp} word found"
				return matches << word.chomp
			end
		end
		puts "Sorry, word not found."
	end

	def partial_match(term)
		matches = []
		@dictionary.each do |word|
			if word.chomp.include?(term)
				matches << word.chomp
			end
		end

		puts "No matches" if matches == []
		puts "Found #{matches.length} matches:" if matches.length > 0
		puts matches
	end

	def begins_with_match(term)
		matches = []
		@dictionary.each do |word|
			if (word.chomp)[0] == term[0]
				matches << word.chomp
			end
		end
		puts "No matches" if matches == []
		puts "Found #{matches.length} matches:" if matches.length > 0
		puts matches
	end

	def ends_with_match(term)
		matches = []
		@dictionary.each do |word|
			if (word.chomp)[-1] == term[-1]
				matches << word.chomp
			end
		end
		puts "No matches" if matches == []
		puts "Found #{matches.length} matches:" if matches.length > 0
		puts matches
	end
end