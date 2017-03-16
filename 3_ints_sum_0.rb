# Write a function that takes an array of integers.  If any 3 integers in the array sum up to 0, return them, else return nil.


def int_sum(arr)
  combos = arr.combination(3).to_a
  hash = {}
  
  combos.each do |combo|
    hash[combo] = combo.reduce(:+)
  end
  
  hash.key(0)
  
  # reduce each combo as a sum
  # if the combo == 0, return the combo
  # if it doesn't exist, then return nil
end