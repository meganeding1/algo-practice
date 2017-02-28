# 


def dec_freq(str)
  h = {}
  
  str.each_char do |char|
    if h[char]
      h[char] += 1
    else
      h[char] = 1
    end
  end
  
  new_str = ""
  
  until h.empty?
    max = h.values.max
    new_str += (h.key(max) * max)
    h.delete(h.key(max))
  end
  
  new_str
end