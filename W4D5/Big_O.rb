def my_min_phase_one(array)
    results = true

    array.each_with_index do |el1, i|
        array.each_with_index do |el2, j|
            if i == j 
                next
            elsif el1 > el2
                results = false
            end
        end
        if results == true
            return el1
        end
        results = true
    end
end
#Complexity O(n^2)
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_phase_one(list)  # =>  -5

def my_min_phase_two(array)
    min = array[0]

    array.each do |ele|
        if ele < min
            min = ele
        end
    end
    min
end

#Complexity O(n)
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_phase_two(list)  # =>  -5

def largest_contiguous_subsum_phase_1(list)
    results = []

    (0...list.length).each do |start|
        (0...list.length).each do |finish|
            results << list[start..finish]
        end
    end
    max = results[0].sum

    results.each do |subArray|
        if subArray.sum > max
            max = subArray.sum
        end
    end
    max
end

#Complexity O(n^2 + (n)) = n^2
# list = [5, 3, -7, -5, 10, 2]
# p largest_contiguous_subsum_phase_1(list)

def largest_contiguous_subsum_phase_2(list)
    max = list[0]
    sum = list[0]

    (1...list.length).each do |idx|
        sum += list[idx]
        if sum > max
            max = sum
        else
            sum = 0
        end
    end
    max
end

#Complexity O(3n) = O(n)
# list = [5, -3, 6] #=> 8
list = [5, 3, -7, -5, 10, 2]
p largest_contiguous_subsum_phase_2(list) #=>