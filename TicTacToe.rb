# We created this module to group related classes together
module TicTacToe
	# It creates a new Game and contain two players and a board
	class Game
		def initialize(player_1_class, player_2_class)
			@board = Array.new(10) # Ignore '0' for the sake of simplicity
			@players = [player_1_class.new(self, "X"), player_2_class.new(self, "O")]
		end

		def print_board
			col_separator = " | "
			row_separator = "--+---+--"
			label_for_position = lambda {|position| @board[position] ? @board[position] : position}
			row_for_display = lambda {|row| row.map(&label_for_position).join(col_separator)}
			row_positions = [[1,2,3], [4,5,6], [7,8,9]]
			rows_for_display = row_positions.map(&row_for_display)
			puts rows_for_display.join("\n" + row_separator + "\n")
		end
	end

	# It creates Player
	class Player
		def initialize(game, marker)
			@game = game # Player should know which game he's playing so he knows which board is available to him
			@marker = marker
		end
	end

	class HumanPlayer < Player
	end
end


include TicTacToe
game = TicTacToe::Game.new(HumanPlayer, HumanPlayer)
game.print_board