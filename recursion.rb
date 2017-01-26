# playing with recursion

# A recursive method is a method that calls itself either directly or indirectly. 

# There are three important rules of thumb in developing recursive programs:

# - The recursion has a base case.
# - Recursive calls must address subproblems that are smaller in some sense, so that recursive calls converge to the base case.
# - Recursive calls should not address subproblems that overlap.

# src: http://algs4.cs.princeton.edu/11model/


# ----------------------
# features of recursion
# ----------------------


# ==================================================================
# ==================================================================
# to be recursive, a piece of code needs a method that calls itself
# ------------------------------------------------------------------

def do_it
  puts "hi"
  do_it
end

# do_it  # uncomment this line to run the function above.  sample output below ...

# play.rb:10: stack level too deep (SystemStackError)


# as an aside ... it helps to see a little more of what's going on in there ...

$counter = 0  # don't use global variables!  ask me why.  
              # that's right, do as as i say, not as i do.  :)

def do_it
  puts "hi, #{$counter += 1}"
  do_it
end

# do_it  # uncomment this line to run the function above.  sample output below ...

# hi, 1
# hi, 2
# hi, 3
# ...
# hi, 9354
# hi, 9355
# hi, 9356
# play.rb:10: stack level too deep (SystemStackError)



# ==================================================================
# ==================================================================
# to reach into the black box of recursive machinery, use parameters
# ------------------------------------------------------------------

def do_it(counter)
  puts "hi, #{counter += 1}"
  do_it(counter)
end

# do_it(0) # uncomment this line to run the function above.  sample output below ...
# notice the difference in stack level (8732) before the error is thrown?  
# compare it to the example above. why is that happening, i wonder?

# hi, 1
# hi, 2
# hi, 3
# ...
# hi, 8730
# hi, 8731
# hi, 8732
# play.rb:20: stack level too deep (SystemStackError)



# ==================================================================
# ==================================================================
# use a base case to keep it stable. like a "kicker" from Inception
# ------------------------------------------------------------------

def do_it(counter)
  puts "hi, #{counter += 1}"
  return if counter > 3
  do_it(counter)
end

# do_it(0) # uncomment this line to run the function above.  sample output below ...

# hi, 1
# hi, 2
# hi, 3
# hi, 4



# ==================================================================
# ==================================================================
# on the way down, on the way up: there are 2 sides to recursion
# ------------------------------------------------------------------

def do_it(counter)
  puts "on the way down, #{counter += 1}"
  return if counter > 3
  do_it(counter)
  puts "on the way up at level #{counter -= 1}"
end

# do_it(0) # uncomment this line to run the function above.  sample output below ...
# are you surprised by this output?  
# if so, there's a hint later on about "unwinding" recursion to help make sense out of it.

# on the way down, 1
# on the way down, 2
# on the way down, 3
# on the way down, 4
# on the way up at level 2
# on the way up at level 1
# on the way up at level 0



# ==================================================================
# ==================================================================
# each recursive level keeps its own state that you can find later
# ------------------------------------------------------------------

def do_it(counter)
  puts "on the way down, #{counter += 1}"
  x = rand(100)
  puts "the magic variable is #{x} at level #{counter}"
  return if counter > 3
  do_it(counter)
  puts "on the way up. found a little magic #{x} at level #{counter -= 1}"
end

# do_it(0) # uncomment this line to run the function above.  sample output below ...

# on the way down, 1
# the magic variable is 52 at level 1
# on the way down, 2
# the magic variable is 24 at level 2
# on the way down, 3
# the magic variable is 30 at level 3
# on the way down, 4
# the magic variable is 24 at level 4
# on the way up. found a little magic 30 at level 2
# on the way up. found a little magic 24 at level 1
# on the way up. found a little magic 52 at level 0



# ==================================================================
# ==================================================================
# ==================================================================
# ------------------------------------------------------------------
# that's all.  if that last one was a little confusing, watch this:
# https://www.dropbox.com/s/jglwmt5ticim3k5/2014-01-30%2011.13.36.mov
# ------------------------------------------------------------------


# oh, by the way, you can expand recursive machines to learn more about them

# def do_it(0)  <--- this 0 is what "comes in the door", so to speak
#   puts "on the way down, #{1}"

#   do_it(1)
#     puts "on the way down, #{2}"

#     do_it(2)
#       puts "on the way down, #{3}"

#       do_it(3)
#         puts "on the way down, #{4}"
#         return if counter > 3   <--- here's the "kicker" we talked about, the base case

#       puts "on the way up at level #{2}"
#     puts "on the way up at level #{1}"
#   puts "on the way up at level #{0}"
# end


# in other news, you can keep the return value of the function call
# -----------------------------------------------------------------

def do_it(counter)
  puts "on the way down, #{counter += 1}"
  return counter if counter > 3              # you can return from the base case
  counter = do_it(counter) - 1               # and use that value
  puts "on the way up at level #{counter}"
  counter                                    # but line 151 now expects a return value!
end

# do_it(0) # uncomment this line to run the function above.  sample output below ...

# on the way down, 1
# on the way down, 2
# on the way down, 3
# on the way down, 4
# on the way up at level 3
# on the way up at level 2
# on the way up at level 1

# ..................................................................

# if any of that was unclear or you have ideas about how to improve it just leave a 
# comment at the bottom for the benefit of others.  i'll try to address your suggestions