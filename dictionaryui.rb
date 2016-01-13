require_relative 'dictionaryloader'
require_relative 'dictionarysearcher'

class DictionaryUI

attr_reader :path

	def initialize(path = nil)
		@path = path
	end

	def run
		puts "Where is your dictionary?"
		@path = gets.chomp
		loader = DictionaryLoader.new(@path)
		loader.stats
		@searcher = DictionarySearcher.new(loader.dictionary)
		@searcher.prompt
	end
end

dict = DictionaryUI.new
dict.run

