require_relative "pieces/null_piece.rb"
require_relative "pieces/bishop.rb"
require_relative "pieces/king.rb"
require_relative "pieces/knight.rb"
require_relative "pieces/pawn.rb"
require_relative "pieces/queen.rb"
require_relative "pieces/rook.rb"

class Board 
    def initialize
        @null_piece = NullPiece.new(:N, self, [0, 0])
        @rows = Array.new(8) { Array.new(8, @null_piece)}
    end

    def [](pos)
        row, col = pos 
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos 
        @rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == nil
            raise "no piece to move"
        elsif self[end_pos].kind_of?(Piece)
            raise "can't move piece"
        else 
            self[end_pos] = self[start_pos]
            self[start_pos] = nil
        end
    end

    def valid_pos?(pos)
        pos.each do |p|
            unless p.between(0,7)
                raise "do you know how to play chess?!"
            end
        end
    end
end