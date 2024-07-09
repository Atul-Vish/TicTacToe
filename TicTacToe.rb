# We created this module to group related classes together
module TicTacToe
	# It creates a new Game and contain two players and a board
	class Game
		@board = Array.new(10) 
		@players = 
	end

	# It creates Player
	class Player
		def initialize(game, marker)
			@game = game # Player should know which game he's playing so he knows which board is available to him
			@marker = marker
		end
	end
end