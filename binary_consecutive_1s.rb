# Given a binary array, find the max consecutive 1s in the array

def cons_binary(array)
  cons = 0
  ones = 0
  array.each do |num|
    if num == 1
      ones += 1
    else
      cons = ones if ones > cons
      ones = 0
    end
  end
  cons
end

cons_binary([1, 0, 0, 1, 1, 1, 0, 1])