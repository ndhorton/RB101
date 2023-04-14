# Madlibs

# input: read from user 4 strings - noun, verb, adjective, adverb
# output: a string that uses these words in a sentence

# Prompt the user for a noun
# Set noun = input
# Prompt the user for a verb
# Set verb = input
# Prompt the user for an adjective
# Set adjective = input
# Prompt the user for an adverb
# Set adverb = input

# Print Why would you [adverb] [verb] your [adjective] [noun]?

def prompt(term)
  if term.start_with?('a')
    print "Enter an #{term}: "
  else
    print "Enter a #{term}: "
  end
end

terms = {
  noun: nil,
  verb: nil,
  adjective: nil,
  adverb: nil
}

terms.each_key do |term|
  prompt(term)
  terms[term] = gets.chomp.downcase
end

puts "Why would you #{terms[:adverb]} #{terms[:verb]} your #{terms[:adjective]} #{terms[:noun]}?"
