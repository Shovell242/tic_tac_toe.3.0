require_relative "player"

class Computer < Player
	
	def go_for_win(array)
		spot = array.map do |hsh|
						if hsh.values.count("O") == 2
							hsh.select { |k,v| v == " " }.keys.first
						end
					 end
		spot.compact.shuffle.first 
	end

	def block_win(array)
		spot = array.map do |hsh|
						if hsh.values.count("X") == 2
							hsh.select { |k,v| v == " " }.keys.first
						end
					 end
		spot.compact.shuffle.first 
	end

	def link_two(array)
		spot = array.map do |hsh|
						if hsh.values.count("O") == 1
							hsh.select { |k,v| v == " " }.keys.first
						end
					 end
		spot.compact.shuffle.first 
	end
end