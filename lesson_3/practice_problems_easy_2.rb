############################################################
# 1)

# See if "Spot" is present
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages["Spot"] # => nil
ages.fetch("Spot") # => KeyError (key not found: "Spot")
ages.fetch("Spot", "Spot not found") # => "Spot not found"
ages.key?("Spot") # => false
ages.has_key?("Spot") # => false
ages.include?("Spot") # => false
ages.member?("Spot") # => false

############################################################
# 2)

munsters_description = "The Munsters are creepy in a good way."

# "The munsters are creepy in a good way."
munsters_description.capitalize

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.swapcase

# "the munsters are creepy in a good way."
munsters_description.downcase

# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase

############################################################
# 3)

# Add ages for Marilyn and Spot to the existing hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# destructive wrt ages; non-destructive wrt additional_ages
ages.merge!(additional_ages)

############################################################
# 4)

# See if the name "Dino" appears in the string below:
advice = "Few things in life are as important as house training your pet dinosaur."

advice.index("Dino") # => nil
# or
advice.match("Dino") # => nil

############################################################
# 5)

# Show an easier way to write this array:

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

############################################################
# 6)

# How can we add the family pet "Dino" to our usual array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones << "Dino"

############################################################
# 7)

# How can we add multiple items to our array? (Dino and Hoppy)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones << "Dino" << "Hoppy"
flintstones.concat(["Dino"], ["Hoppy"])
flintstones.push("Dino", "Hoppy")

############################################################
# 8)

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0...advice.index("house"))
# or
advice.slice!(0, advice.index("house"))

############################################################
# 9)

# Write a one-liner to count the number of lower-case 't' characters in the
# following string:
statement = "The Flintstones Rock!"

statement.count("t")

############################################################
# 10)

# If we had a 40 character wide table of Flintstone family members, how could
# we easily center that title above the table with spaces?

title = "Flintstone Family Members"
title.center(40)