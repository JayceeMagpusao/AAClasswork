require "tdd"

describe "#remove_dups" do
    it "returns the unique elements in the order in which they appeared" do
        expect(remove_dups([1, 2, 1, 3, 3])).to eq([1, 2, 3])
    end
end

describe "Array" do
    describe "#two_sum" do
        it "finds all pairs of positions where the elements at those positions sum to zero." do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
    end
end

describe "my_transpose" do
    it "will convert between the row-oriented and column-oriented representations." do
        expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
end