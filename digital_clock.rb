# Given four digits, find the maximum valid time that can be displayed on a digital clock in a 24-hour format using those digits.  

# EX: given digits 1, 8, 3, 2, the max valid time is "23:18".

# If a valid time can be created with the given digits, the function returns a string in the format "HH:MM" or "NOT POSSIBLE" if it is not possible to display a valid time

def digital(a,b,c,d)
  array = [a, b, c, d]
  if a > 9 || b > 9 || c > 9 || d > 9
    return "NOT POSSIBLE"
  end
  if a < 0 || b < 0 || c < 0 || d < 0
    return "NOT POSSIBLE"
  end
  h1 = [2, 1, 0]
  h2 = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  m1 = [5,4,3,2,1,0]
  m2 = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  h1_r = 0
  h2_r = 0
  m1_r = 0
  m2_r = 0
  h1.each do |i|
    if array.include?(i)
      if i>= h1_r
        h1_r = array.slice!(array.index(i))
      end
    end
  end
  if array.length > 3
    return "NOT POSSIBLE"
  end
  h2.each do |i|
    if h1_r == 2
      if array.include?(i) && (i < 4) && i > h2_r
        h2_r = array.slice!(array.index(i))
      end
    else
      if array.include?(i) && i > h2_r
        h2_r = array.slice!(array.index(i))
      end
    end
  end
  if array.length > 2
    return "NOT POSSIBLE"
  end
  m1.each do |i|
    if array.include?(i)
      if i > m1_r
        m1_r = array.slice!(array.index(i))
      end
    end
  end
  if array.length > 1
    return "NOT POSSIBLE"
  end
  m2.each do |i|
    if array.include?(i)
      if i > m2_r
        m2_r = array.slice!(array.index(i))
      end
    end
  end
  if array.length > 1
    return "NOT POSSIBLE"
  end
  return "#{h1_r}#{h2_r}:#{m1_r}#{m2_r}"
end

# test code
p digital(8, 1, 1,5)
p digital(8,2,4,5)
p digital(2, 4, 0, 0)
p digital(3, 0, 7, 0)
p digital(9, 1, 9, 7)
p digital(-10, 4, 5, 3)
p digital(0, 10, 4, 3)
p digital(9, 5, 2, 3)
p digital(2, 9, 8, 7)
p digital(1,8,3,6)
p digital(3,8,2,2)