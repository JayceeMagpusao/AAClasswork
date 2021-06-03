module Slideable
    def horizontal_dirs
        row, col = @pos

        possible = []

        @board[row].each.with_index do |r, i|
            possible << [row, i] unless [row, i] == @pos
        end

        @board.each.with_index do |c, i|
            possible << [i, col] unless [i, col] == @pos
        end
        possible
    end

    def diagonal_dirs
        possible = []

        row, col = @pos
        until col == 0 || row == 0
            col -= 1
            row -= 1
            possible << [row, col]
        end

        row, col = @pos
        until col == 0 || row == 8
            col -= 1
            row += 1
            possible << [row, col]
        end

        row, col = @pos
        until col == 8 || row == 8
            col += 1
            row += 1
            possible << [row, col]
        end
        
        row, col = @pos
        until col == 8 || row == 0
            col += 1
            row -= 1
            possible << [row, col]
        end
        possible
    end
end