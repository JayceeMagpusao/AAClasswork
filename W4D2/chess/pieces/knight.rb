require_relative "piece"

class Knight < Piece
    def symbol
        Knight
    end

    def moves
        poss_positions = []
        row, col = @pos

        poss_moves = [1, -1, 2, -2].permutation(2).to_a
        poss_moves.reject! { |move| ( move[0] + move[1] ) == 0 }
        poss_moves.each { |move| poss_positions << [ row + move[0], col + move[1] ] }
        poss_positions.select! { |position| position[0].between?(0, 7) && position[1].between?(0, 7) }
        poss_positions.select! { |move| self.color != self[move].color }
        poss_positions
    end
end