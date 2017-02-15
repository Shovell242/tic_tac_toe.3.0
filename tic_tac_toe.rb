require_relative "game"

def game_information
	puts "TIC TAC TOE v.3"
	puts "***************"
end

def player_choice
	puts "Who would you like to play in the game?"
	puts "(1) Friend"
	puts "(2) Computer"
	print "Please choose 1 or 2: "
	choice = gets.chomp.to_i
end

def play_again?
	puts "Would you like to play again? (y/n)"
	answer = gets.chomp 
end

def game(choice)
	if choice == 1
		print "Player 1 please enter your name: "
		player1 = gets.chomp
		print "Player 2 please enter your name: "
		player2 = gets.chomp
		PlayGame.new(board: Board.new, player1: Player.new(name: player1, game_piece: "X"),
								 player2: Player.new(name: player2, game_piece: "O"))
	elsif choice == 2
		print "Player 1 please enter your name: "
		player1 = gets.chomp
		PlayGame.new(board: Board.new, player1: Player.new(name: player1, game_piece: "X"), 
			           player2: Computer.new(name: "Computer", game_piece: "O"))
	end
end

game(player_choice)



