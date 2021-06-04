# Phase 1 ---------------------------------------------
def first_anagram?(str1, str2)
  results = str1.split('').permutation(str1.length)
  results = results.map { |subarr| subarr.join('') }
  results.include?(str2)
end

# str1 = "abc"
# str2 = "abc"

# p first_anagram?(str1, str2)

# time complexity == O(n!)

# Phase 2 ---------------------------------------------
def second_anagram?(str1, str2)
  # iterate over str1

  str1.each_char.with_index do |char, i|
  # # for each char, find index of char in str2 using #find_index
    found_index = str2.index(char)
      # # delete str2[@ found index]
    return false if found_index == nil
    str2 = str2[0...found_index] + str2[found_index + 1..-1]
  end

  # if str2 is empty? then return true
  str2.empty? ? true : false
end

# str1 = "cat"
# str2 = ""
# p second_anagram?(str1, str2)

# time complexity == O(n^2)

# Phase 3 ---------------------------------------------
def third_anagram?(str1, str2)
  str1.split('').sort == str2.split('').sort
end

# str1 = "cat"
# str2 = "tac"
# p third_anagram?(str1, str2)

# time complexity O(n * log n)

# Phase 4 ---------------------------------------------
def fourth_anagram?(str1, str2)
  hash = Hash.new(0)

  str1.each_char do |ele|
    hash[ele] += 1
  end

  str2.each_char do |ele|
    hash[ele] -= 1
  end

  hash.values.all? { |el| el == 0 }
end

# str1 = "cat"
# str2 = "tac"
# p fourth_anagram?(str1, str2)

# time complexity == O(n)
