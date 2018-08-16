#!/usr/bin/env ruby

# Seed with a random number
base = rand 10**5...(10**6-1)

# Calculate last digit which is a checksum of the base digits
# https://en.wikipedia.org/wiki/DEA_number#Current_format
n = base
odds_sum = 0
evens_sum = 0
for i in 0..5 do
  if i % 2 == 0
    evens_sum += n % 10
  else
    odds_sum += n % 10
  end
  n /= 10
end
checksum = (odds_sum + evens_sum*2) % 10
dea_number_number = base*10 + checksum # numeric portion

# Randomly choose the first letters
# https://en.wikipedia.org/wiki/DEA_number#Current_format
REGISTRANT_TYPES = 'BCDEFGHJKLMPRSTUX'.split ''
SECOND_LETTERS = [*('A'..'Z'), '9']
first_2_letters = "#{REGISTRANT_TYPES.sample}#{SECOND_LETTERS.sample}"

# Display the result
dea_number = first_2_letters + dea_number_number.to_s
puts dea_number
