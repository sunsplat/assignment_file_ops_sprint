class DictionaryLoader

	attr_accessor :dictionary

	def initialize(file_name)
		@dictionary = File.open(file_name).readlines
	end

	def stats
		puts "Dictionary successfully loaded"
		puts "Your dictionary contains #{@dictionary.length} words"
		puts "Word frequency by starting letter:"
		puts first_letter
	end

	def first_letter
		words = {}
		('a'..'z').each do |letter|
			words[letter] = 0
		end
		@dictionary.each do |word|
			words[word[0].downcase] += 1
		end
		puts words
	end
end

