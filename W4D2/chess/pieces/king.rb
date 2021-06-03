require_relative "piece"

class King < Piece
    def symbol
        King
    end

    def moves
        poss_positions = []
        row, col = @pos

        poss_moves = [0, 1, 1, -1, -1].permutation(2).to_a.uniq
        poss_moves.each { |move| poss_positions << [ row + move[0], col + move[1] ] }
        poss_positions.select! { |position| position[0].between?(0, 7) && position[1].between?(0, 7) }
        poss_positions
    end
end