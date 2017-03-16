# 1: print integers from 1 to 100
# 2: instead of multiples of 3, print “hello”
# 3: instead of multiples of 5, print “world”
# 4: for multiples of both, print “helloworld”

# Part 1
i = 0
until i == 100
	i += 1
	p i 
end 

# Part 2
i = 0
until i == 100
	if i%3 == 0
		p "Hello"
	else
		p i
	end 
	i += 1
end 

# Part 3
i = 0
until i == 100
	if i%3 == 0
		p "Hello"
	elsif i%5
		p "World"
	else
		p i
	end 
	i += 1
end 

# Part 4
i = 0
until i == 100
	if i%3 == 0 && i%5 == 0
		p "Hello World"
	elsif i%3
		p "Hello"
	elsif i%5
		p "World"
	else
		p i
	end 
	i += 1
end 