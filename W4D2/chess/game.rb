require_relative "board.rb"

class Game
    def initialize
        @board = Board.new
        @player1 = :W 
        @player2 = :B
    end

    def place_pieces
        @board[[0, 0]] = Rook.new(:W, @board, [0, 0])
        @board[[0, 7]] = Rook.new(:W, @board, [0, 7])
        @board[[0, 1]] = Knight.new(:W, @board, [0, 1])
        @board[[0, 6]] = Knight.new(:W, @board, [0, 6])
        @board[[0, 2]] = Bishop.new(:W, @board, [0, 2])
        @board[[0, 5]] = Bishop.new(:W, @board, [0, 5])
        @board[[0, 3]] = Queen.new(:W, @board, [0, 3])
        @board[[0, 4]] = King.new(:W, @board, [0, 4])
        @board[[1, 0]] = Pawn.new(:W, @board, [1, 0])
        @board[[1, 7]] = Pawn.new(:W, @board, [1, 7])
        @board[[1, 1]] = Pawn.new(:W, @board, [1, 1])
        @board[[1, 6]] = Pawn.new(:W, @board, [1, 6])
        @board[[1, 2]] = Pawn.new(:W, @board, [1, 2])
        @board[[1, 5]] = Pawn.new(:W, @board, [1, 5])
        @board[[1, 3]] = Pawn.new(:W, @board, [1, 3])
        @board[[1, 4]] = Pawn.new(:W, @board, [1, 4])

        @board[[7, 0]] = Rook.new(:B, @board, [7, 0])
        @board[[7, 7]] = Rook.new(:B, @board, [7, 7])
        @board[[7, 1]] = Knight.new(:B, @board, [7, 1])
        @board[[7, 6]] = Knight.new(:B, @board, [7, 6])
        @board[[7, 2]] = Bishop.new(:B, @board, [7, 2])
        @board[[7, 5]] = Bishop.new(:B, @board, [7, 5])
        @board[[7, 3]] = Queen.new(:B, @board, [7, 3])
        @board[[7, 4]] = King.new(:B, @board, [7, 4])
        @board[[6, 0]] = Pawn.new(:B, @board, [6, 0])
        @board[[6, 7]] = Pawn.new(:B, @board, [6, 7])
        @board[[6, 1]] = Pawn.new(:B, @board, [6, 1])
        @board[[6, 6]] = Pawn.new(:B, @board, [6, 6])
        @board[[6, 2]] = Pawn.new(:B, @board, [6, 2])
        @board[[6, 5]] = Pawn.new(:B, @board, [6, 5])
        @board[[6, 3]] = Pawn.new(:B, @board, [6, 3])
        @board[[6, 4]] = Pawn.new(:B, @board, [6, 4])
    end
    def render
        @board.each do |row|
            row.each do |pos|

            end
        end
    end
end