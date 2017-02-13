class Player
	attr_reader :name, :game_piece

	def initialize(args)
		@name       = args.fetch(:name)
		@game_piece = args.fetch(:game_piece)
	end
end