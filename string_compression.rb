# Given a string in the form 'AAAABBBBCCCCCDDEEEE' compress it to become 'A4B4C5D2E4'. For this problem, you can falsely "compress" strings of single or double letters. For instance, it is okay for 'AAB' to return 'A2B1' even though this technically takes more space.

# The function should also be case sensitive, so that a string 'AAAaaa' returns 'A3a3'.


# Solution 1: uses Ruby internals
def stringcompression(string)
  arraystring = string.chars
  outputhash = {}
  outputstring = []

  arraystring.each do |char|
    if outputhash.has_key?(char)
      outputhash[char] += 1
    else
      outputhash[char] = 1
    end
  end

  outputhash.each do |key, value|
    outputstring << key
    outputstring << value
  end

  outputstring.join
end


# Solution 2: more manual approach w/o using a hash or Ruby internals
def compress(str)
  output = ''
  len = str.length
  # Edge case - Check for length 0
  return '' if len == 0
  # Edge case - Check for length 1
  return str + '1' if len == 1
  # Initialize count and index variables
  count = 1
  i = 1
  while i < len do
    if str[i] == str[i-1]
      count += 1
    else
      output = output + str[i-1] + count.to_s
      count = 1 #reset count
    end
    i += 1 
  end
  output = output + str[i-1] + count.to_s
  return output
end
# p compress('AAAAABBBBCCCC')
# p compress('')
# p compress('A')

