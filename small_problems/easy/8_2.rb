# Madlibs

# input: get from user noun, verb, adjective, adverb (prompts given in example)
# output: print to screen (from example): 
#   'Do you ' + verb + ' your ' + adjective + noun + adverb + "? That's hilarious!" 

# limit cases:
# empty strings: loop prompt until not empty
# non-alphanumeric chars: leave as they are

# DS: strings
# algo:

# -start
# -Prompt user for strings noun, verb, adjective, adverb and store in vars
# -Print 'Do you ' + verb + ' your ' + adjective + noun + adverb + "? That's hilarious!"
# -end

def prompt(message)
  print "=> #{message}: "
end

def print_out(message)
  puts "=> #{message}"
end

noun = ''
verb = ''
adjective = ''
adverb = ''

system('clear')

while noun.empty?
  prompt('Enter a noun')
  noun = gets.chomp
end

while verb.empty?
  prompt('Enter a verb')
  verb = gets.chomp
end

while adjective.empty?
  prompt('Enter an adjective')
  adjective = gets.chomp
end

while adverb.empty?
prompt('Enter an adverb')
adverb = gets.chomp
end

puts
print_out("Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!")

# LS solution similar to above but implements random sentence structures using Array#sample

# edge cases for more complex sentence structures involving past tense, indefinite article etc
# you would need to create methods to check the beginning and ends
# of user input nouns etc for purposes of elision and conjugation 