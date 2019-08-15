# the problem consists of determining how many valley's
# Gary traversed.
#
# a Valley is a consecutive number of steps below sea level
# so given that U = uphill and D = downhill
# consecutive Us would denote a valley
#
# Examples
#
# I -> number of Integer:Steps, String:path
#
# I -> 6, 'UUUDDU'
# O -> 1 valley
#
# I -> 10, 'UUUDDUUDDD'
# O -> 2 valleys
#
#

# Data Structure
#
# checking for consecutive letters within a string
# because I can perform scans on a string with ruby, I will use
# a string as the data structure
#

# Algorithm
#
# using the string argument
# call the scan method on the string
# pass a regexp checking for 2 or more Us
#
# because scan returns an array we can call count
# on the array, this will be our valley count
#
#
# missed a crucial element,
# a valley is BELOW sea level, so I have to track how many times
# it goes below sea level
#
# loop through string
#   before mutation
#   on each iteration increment or decrement sea level
#
# if the number is < 0 then I can say it's a valley

def countingValleys(n, s)
  # check constraints
  # do steps match string length
  n_does_not_equal_s_length = n != s.scan(/[UD]/).count
  steps_are_invalid = n < 2 && n > 10**6

  returned_to_sea_level_count = 0
  sea_level = 0

  if (steps_are_invalid || n_does_not_equal_s_length)
    return 0
  end

  # s.scan(/(DU{1}U{2,}UD{1})/).count
  s.split('').each do |l|
    previous_sea_level = sea_level

    if l == 'U'
      sea_level += 1
    elsif l == 'D'
      sea_level -= 1
    end

    if sea_level == 0 && previous_sea_level < 0
      returned_to_sea_level_count += 1
    end
  end

  returned_to_sea_level_count
end

# p countingValleys(4, 'UUDD') # returns 1
p countingValleys(15, 'UUDDDDUUUDDDUUU') # returns 1
# p countingValleys(4, 'UUDD') # returns 1
p countingValleys(8, 'UDDDUDUU') # returns 1
p countingValleys(10, 'DDUDDUUDUU') # -1, -2, -1, -2, -1, 0
