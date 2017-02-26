# Sentence Reversal - Problem

# Given a string of words, reverse all the words. For example:
# Given: 'This is the best'
# Return: 'best the is This'

# As part of this exercise you should remove all leading and trailing whitespace. So that inputs such as: '  space here'  and 'space here      '
# both become: 'here space'

# Note: I advise doing this as manual as possible for interview preparation, so `.split` is not allowed. I'll allow `.reverse` and `.join`, but you can make the solution more manual by implementing a reversal function if you want to go further.

def reverse_sentence(sentence)
    #get rid of all leading 
    sentence = sentence.rstrip.lstrip
    sentence_array = []
    
    i = 0
    while i < sentence.length
        if sentence[i] == " "
            sentence_array << sentence[0...i]
            # no need to check if in bounds here since rstrip demands that the last character not be a space
            sentence = sentence[i+1..-1]
            i = 0
        else
            i += 1
        end
        #finally get the last spaceless word
    end
    sentence_array << sentence

    sentence_array.reverse.join(" ")
end


# Solution 1 - Simple approach
# A more manual approachh would be to loop over the text and push words to a stack and hen reverse.
def rev_word(str)
  str.split(' ').reverse.join(' ')
end


# Solution 2 - More manual interview approach
def rev_word2(str)
  words = []
  len = str.length
  space = ' '
  # index tracker
  i = 0
  # while we haven't iterated through the entire string
  while i < len do
    # if current letter is not a space then we know a word starts at that index
    if str[i] != space 
      word_start = i
      # keep going until we haven't hit another space
      while i < len && str[i] != space
        # Get index where word ends
        i += 1
      end
      # once while loop has completed push to words array 
      words.push(str[word_start...i])
    end
    # add to index tracker
    i += 1
  end 
  #Join the reversed words array
  return words.reverse.join(' ')
end
p rev_word('This is the best')
p rev_word('   Hello John    how are you   ')

