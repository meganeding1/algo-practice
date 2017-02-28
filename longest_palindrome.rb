# given a string, find the longest possible palindrome.  letters in the string can be reordered.  

# capitalization matters.  EX: Aa is not a palindrome but aa is one.  return the length of the longest possible palindrome.

def pal(string)
  h = {}
  
  string.each_char do |char|
    if h[char]
      h[char] += 1
    else
      h[char] = 1
    end
  end
  
  even_vals = h.values.select { |num| num.even? }
  odd_vals = h.values - even_vals
  max_odd = odd_vals.max
  
  even_sum = even_vals.reduce(:+)
  max_pal_length = max_odd + even_sum
end