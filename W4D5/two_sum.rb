def bad_two_sum?(arr, target_sum)
    arr = arr.permutation(2)

    arr.each do |pair|
        return true if pair.sum == target_sum
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
    # iterate through each number in array
    # within each iteration subtract current number from target sum
    # perform bsearch on array with targetsum - current number
    # if bsearch does not return nil we can immediately return true
    arr.each do |ele|
        newTarget = target_sum - ele
        if bsearch(arr, newTarget) != nil
            return true
        end
    end
    false
end

def bsearch(array, target)
    return nil if array.empty?

    mid = array.length / 2
    return array[mid]  if array[mid] == target

    left = array[0...mid]
    right = array[mid+1..-1]

    if target < array[mid]
        bsearch(left, target) 
    else
        bsearch(right, target) 
    end
end

arr = [0, 7, 1, 5]
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false