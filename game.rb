require_relative "board"
require_relative "player"
require_relative "ai"

class PlayGame
	attr_reader :board, :player1, :player2, :current_player

	def initialize(args)
		@board          = args.fetch(:board)
		@player1        = args.fetch(:player1)
		@player2        = args.fetch(:player2)
		@current_player = nil
		game_flow
	end

	def welcome
		puts "Hello and welcome to Tic Tac Toe!"
	end

	def players
		[player1, player2]
	end

	def game_pieces
		["X", "O"]
	end

	def computer_move
		array = board.board_results
		win   = player2.go_for_win(array)
		block = player2.block_win(array)
		link  = player2.link_two(array)

		case 
		when win
			return win + 1
		when block
			return block + 1
		when link
			return link + 1
		else
			board.random + 1
		end
	end

	def get_user_move(player)
		puts "#{player} please select the key you want to place your game piece on"
		key = gets.chomp.to_i
		board.valid_move?(key) ? key : incorrect_move(player)
	end

	def incorrect_move(player)
		puts "That spot is occupied, please choose another key"
		get_user_move(player)
	end

	def congrats_winner
		puts board.full_display
		puts "Congrats to #{current_player}! You have won the game!"
	end

	def game_draw
		puts board.full_display
		puts "I'm sorry, the game has ended in a draw"
	end

	def end_of_game
		return congrats_winner if board.winner?
		return game_draw if board.draw?
	end

	def game_flow
		welcome
		catch :winner! do
			loop do
				players.each do |player|
					@current_player = player.name
					board.full_display
					move = player.name == "Computer" ? computer_move : get_user_move(player.name)
					board.place_gamepiece(move, player.game_piece)
					throw :winner! if board.game_over?
				end
			end
		end
		end_of_game
	end
end









