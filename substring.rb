# Check a string to see if a given substring is part of that string

# Solution 1
my_string = "abcdefg"
my_string.include? "cde"
# => include? is case sensitive and returns true or false


# Solution 2
my_string = "Hello world"
my_string["Hello"]
# => returns the query substring if found or nil if not found
