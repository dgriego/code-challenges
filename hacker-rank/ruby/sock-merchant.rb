# integers represent sock colors
#
# this is represented as an array of integers where
# each integer represents an individual sock
#
# large pile of socks that need to be matched, think laundry day.. ugghg that sucks
# ok....fine, I'll pair the sucks
#
# the result should be a count of how many pairs of matching socks there are.
# each sock is unique and can only be used in one pair, as sucks would
# behave because we don't have sock cloning technology quite yet.
#

# Examples
#
# constraints:
# 1 <= n <= 100, the sock count should be greater than equal to 1 and less than or equal to 100
# 1 <= ar[i], each Int:color must be greater or equal to 1
#
# 5 socks
# Array:[1, 3, 4, 2, 1] = Int:1 pair [(1, 1)]
#
# 3 socks
# Array:[2, 2, 1] = Int:1 pair [(2, 2)]
#
# 8 socks
# Array:[1, 1, 3, 3, 2, 2] = Int:3 pairs [(1, 1), (3, 3), (2, 2)]
#

# Data Structure
#
# because the colors will be integers within an array, we can naturally assume to loop
# through each element in the array and validate a count
#
# my appraoch will be to use the array argument to loop through a collect counts of
# each object in the array, which I can extract to produce a pairs count
#
# the 'counts' will be a hash of counts of each object in the array argument
#

# Algorithm
#
# check constraint, sock count argument
# n >= 1 && n <= 100,
# print message for correction and return 0
#
# initialize empty counts hash
# initialize pair_counts integer
#
# begin looping through colors
#   begin incrementing the count of each color by adding
#   the current object as a key in the hash with the value
#   being the number of occurences
#
#   if any keys match current value?
#     update the hash where key exists by 1
#   else
#     set the key in the hash and initialize to 1
#
#   here we should have a hash with counts
#
#   Begin loop through hash
#   divide each count by 2 and increment the pair_counts with the result
#   the logic being that an number represents a 'pair'
#
#   finally,
#   return pair_count

def sockMerchant(n, ar)
  pair_value = 2

  unless (n.between?(1, 100))
    puts 'number of socks must be between 1 and 100'
    return 0
  end

  color_counts = {}
  pairs_count = 0

  ar.each do |color|
    if (color_counts.has_key? color)
      color_counts[color] += 1
    else
      color_counts[color] = 1
    end
  end

  color_counts.values.each do |count|
    pairs_count += count / pair_value
  end

  pairs_count
 end

 # sockMerchant(0, [])
 puts sockMerchant(5, [1, 3, 3, 2, 1])
