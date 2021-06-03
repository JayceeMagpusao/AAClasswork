require 'colorize'

class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def pos=(val)
        @pos = val
    end

    def symbol
        Piece
    end

    def to_s
        if self.is_a?(Rook) && @color == :W
            puts "R".green
        elsif self.is_a?(Rook) && @color == :B 
            puts "R".blue
        elsif self.is_a?(Knight) && @color == :W
            puts "N".green
        elsif self.is_a?(Knight) && @color == :B
            puts "N".blue
        elsif self.is_a?(Bishop) && @color == :W
            puts "B".green
        elsif self.is_a?(Bishop) && @color == :B
            puts "B".blue
        elsif self.is_a?(Queen) && @color == :W
            puts "Q".green
        elsif self.is_a?(Queen) && @color == :B
            puts "Q".blue
        elsif self.is_a?(King) && @color == :W
            puts "K".green
        elsif self.is_a?(King) && @color == :B
            puts "K".blue
        elsif self.is_a?(Pawn) && @color == :W
            puts "p".green
        elsif self.is_a?(Pawn) && @color == :B
            puts "p".blue
        elsif self.is_a?(NullPiece)
            puts " "
        end
    end
end