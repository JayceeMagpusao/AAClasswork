def remove_dups(arr)
    hash = Hash.new(0)

    arr.each do |ele|
        hash[ele] += 1
    end
    hash.keys
end

class Array
    def two_sum
        results = []

        (0...self.length - 1).each do |i|
            (0...self.length).each do |j|
                if j > i && self[i] + self[j] == 0
                    results << [i, j]
                end
            end
        end
        results
    end
end

def my_transpose(array)
    zipped = []

    (0...array.length).each do |i|
        temp = []
        array.each do |row|
            temp << row[i]
        end
        zipped << temp
    end
    zipped
end
