class Board
	WINNING_COMBOS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
	BOARD_KEY      = (1..9).to_a
	GAME_BOARD     = Array.new(9," ")

	def full_display
		puts "Key:"
		puts display_board(BOARD_KEY)
		puts "\nGame Board:"
		puts display_board(GAME_BOARD)
	end

	def place_gamepiece(key, piece)
		GAME_BOARD[key - 1] = piece
	end

	def game_over?
		winner? || draw?
	end

	def display_board(board)
		c = 0
		loop do 
			print board.slice(c,3).join(" | ").rjust(11)
			break if c == 6
			print "\n -----------\n"
			c += 3
		end
	end

	def analyze_board(array)
		hsh = {}
		array.each do |i|
			hsh[i] = GAME_BOARD[i]
		end
		hsh
	end

	def board_results
		WINNING_COMBOS.map { |x| analyze_board(x) }
	end

	def winner?
		WINNING_COMBOS.each do |combos|
			return true if win_test(combos)
		end
		false
	end

	def random
		GAME_BOARD.index(" ")
	end

	def draw?
		GAME_BOARD.count(" ") == 0
	end

	def win_test(array)
		arr = []
		array.each { |i| arr << GAME_BOARD[i] }
		arr.count("X") == 3 || arr.count("O") == 3
	end
end
