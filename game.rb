require_relative "board"
require_relative "player"

class PlayGame
	attr_reader :board, :players, :current_player

	def initialize(args)
		@board          = args.fetch(:board)
		@players        = human_players
		@current_player = nil
		game_flow
	end

	def welcome
		puts "Hello and welcome to Tic Tac Toe!"
	end

	def get_username(num)
		print "Player #{num} please enter your name: "
		name = gets.chomp
	end

	def game_pieces
		["X", "O"]
	end

	def human_players
		2.times.map do |x|
			Player.new(name: get_username(x + 1), game_piece: game_pieces[x])
		end
	end

	def get_user_move(player)
		puts "#{player} please select the key you want to place your game piece on"
		key = gets.chomp.to_i
	end

	def congrats_winner
		puts "Congrats to #{current_player}! You have won the game!"
	end

	def game_draw
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
					board.place_gamepiece(get_user_move(player.name), player.game_piece)
					throw :winner! if board.game_over?
				end
			end
		end
		end_of_game
	end
end

