require_relative "piece"
class Pawn < Piece
    def symbol
        Pawn
    end

    # def at_start_row?
    #     if (@color == :W && @pos[0] == 6) || (@color == :B && @pos[0] == 1)
    #         true
    #     else
    #         false
    #     end
    # end

    # def moves
    #     possible_moves = []
    #     row, col = @pos

    #     if @color == :W && self.at_start_row?
    #         possible_moves << [row - 2, col]
    #         posible_moves << [row - 1, col]
    #     elsif @color == :W
    #         possible_moves << [row - 1, col]
    #     elsif @color == :B && self.at_start_row?
    #         possible_moves << [row + 2, col]
    #         posible_moves << [row + 1, col]
    #     elsif @color == :B
    #         possible_moves << [row + 1, col]
    #     end

    #     if @color == :W
    #         left_pos = [row + 1, col - 1]
    #         right_pos = [row + 1, col + 1]
    #         unless left_pos[1] == -1 || right_pos[1] == 8
    #             possible_moves << left_pos if @grid[left_pos].color == :B
    #             possible_moves << right_pos if @grid[right_pos].color == :B
    #         end
    #     elsif @color == :B
    #         left_pos = [row - 1, col - 1]
    #         right_pos = [row - 1, col + 1]
    #         unless left_pos[1] == -1 || right_pos[1] == 8
    #             possible_moves << left_pos if @grid[left_pos].color == :W
    #             possible_moves << right_pos if @grid[right_pos].color == :W
    #         end
    #     end
    # end
end