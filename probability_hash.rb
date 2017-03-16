#pick a key out of a hat
# function dist(props);

# ‘probs’ is a probability distribution
# assume the values of the dictionary sum to 1.0

# example input:
# var probs = {a: 0.31, b: 0.24, c: 0.26, d: 0.19};
# should return ‘a’ 31% of the time, return ‘b’ 24% of the time


def probs_hash(hash, float)
  values = hash.values.map { |num| num * 100 }
  totals = []
  
  values.each do |num|
   if !totals.empty?
     totals << (num + totals[-1])
    else
      totals << num
    end
  end

  case float
    when 0..totals[0]
      'a'
    when totals[0]..totals[1]
      'b'
    when totals[1]..totals[2]
      'c'
    when totals[2]..totals[3]
      'd'
    else 
      'not valid argument'
  end
end

h =  {a: 0.31, b: 0.24, c: 0.26, d: 0.19}


p probs_hash(h, 2)
p probs_hash(h, 99)
p probs_hash(h, 65)