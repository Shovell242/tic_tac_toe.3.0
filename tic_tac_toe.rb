require_relative "game"

PlayGame.new(board: Board.new, player1: Player.new(name: "Ryan", game_piece: "X"),
						player2: Computer.new(name: "Computer", game_piece: "O"))