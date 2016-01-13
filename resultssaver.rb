class ResultsSaver
	#prmopt user to save results
	#if saving, prompt user for name of file
	#check if file already exists
	#asks whether to overwrite the file
		# if overwrite, save file

	def initialize(results)
		@results = results
	end

	def prompt
		puts "Do you want to save results? Y or N"
		answer = gets.chomp.downcase
		if answer == 'y'
			save_results(@results)
		elsif answer == 'n'
			return 'n'
		else
			return 'q'
		end
	end

	def save_results(results)
		results_text = File.open("results.txt", "w")
		if results_text.read != empty?
			results_text.write(results)
		else
			puts "Would you like to overwrite the file? Y or N"
			answer = gets.chomp.downcase
			if answer == 'Y'
				results_text.write(results)
			else
				puts "Select new file name"
				file_name = gets.chomp
				new_file_name = File.open(file_name, "w")
				new_file_name.write(results)
			end
		end
	end
end