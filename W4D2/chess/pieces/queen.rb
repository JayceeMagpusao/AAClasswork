require_relative "piece"
require_relative "../modules/slideable"

class Queen < Piece
    include Slideable
    def symbol
        Queen
    end
end