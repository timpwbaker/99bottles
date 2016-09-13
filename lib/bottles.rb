class Bottles

	def get_variables(current)
		@number_one = current
		@number_two = current-1
		@plural_one = 'bottles'
		@plural_two = 'bottles'
		@take_down = 'one'

		if current == 1
			@plural_one = 'bottle' 
			@take_down = 'it'
		end

		if current - 1 == 1
			@plural_two = 'bottle'
		end

		if current-1 == 0
			@number_two = 'no more' 
		end
	end

	def last_verse
		return 'No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
'
	end

	
	def verse (current)
		
		return last_verse if current == 0

		get_variables(current)

		return "#{@number_one} #{@plural_one} of beer on the wall, #{@number_one} #{@plural_one} of beer.
Take #{@take_down} down and pass it around, #{@number_two} #{@plural_two} of beer on the wall.
"
	end

	def verses(last, first)

		arr = Array(first..last)

		output = []

		arr.reverse.each do |current|

			output << verse(current)
			
		end

		return output.join("\n")

	end

	def song
		verses(99, 0)
	end
end