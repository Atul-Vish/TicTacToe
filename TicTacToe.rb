# We created this module to group related classes together
module TicTacToe
	# It creates a new Game and contain two players and a board
	class Game
		def initialize(player_1_class, player_2_class)
			@board = Array.new(10) # Ignore '0' for the sake of simplicity
			@players = [player_1_class.new(self, "X"), player_2_class.new(self, "O")]
			@current_player_id = 0
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

		# Return the free positions on the board, in the form of array
		def free_positions
			(1..9).select {|position| @board[position].nil?}
		end

		def current_player_id
			@current_player_id
		end

		def opponent_player_id
			1 - current_player_id
		end

		def current_player
			@players[current_player_id]
		end

		def opponent_player
			@players[opponent_player_id]
		end

		def switch_players
			@current_player = opponent_player_id
		end

		# Place player marker on the position he selected
		# This is the method that establishes the relationship between Game and Player class
		def place_player_marker(player)
			position = player.select_position!
			puts "#{player} choose #{player.marker} position #{position}"
			@board[position] = current_player.marker
		end
	end

	# It creates Player
	class Player
		attr_accessor :marker
		def initialize(game, marker)
			@game = game # Player should know which game he's playing so he knows which board is available to him
			@marker = marker
		end
	end

	class HumanPlayer < Player
		def select_position!
			@game.print_board
			loop do 
				puts "Select your #{marker} position"
				selection = gets.to_i
				return selection if @game.free_positions.include?(position)
				puts "Position #{selection} is not available, Try again!!"
			end
		end

		def to_s
			"Human"
		end
	end
end


include TicTacToe
game = TicTacToe::Game.new(HumanPlayer, HumanPlayer)
game.print_board