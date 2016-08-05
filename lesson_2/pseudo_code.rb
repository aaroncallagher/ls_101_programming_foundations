# *** 1 ***
START

GET number from user and SET to variable number1
GET number from user and SET to variable number2

PRINT number1 + number2

END

# *** 2 ***
START

SET iterator = 0
SET new_string = ""

# given an array of strings
WHILE iterator < length of array - 1
  new_string = current string + current word in array
  iterator = iterator + 1
  
PRINT new_string

END

# *** 3 ***
START

# given an array of integers
SET iterator = 0 

WHILE iterator < length of array - 1
  delete value of array at space iterator
  PRINT array
  reset array

END
