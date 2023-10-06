# Madlibs Revisited

=begin

Notes:

Problem:
input: a file
output: print to screen file with substitutions

Write a program that reads in text from a file and replaces
placeholders for nouns, verbs, adjectives and adverbs
with random examples of each word type.

rules:
  must read text from file

Examples / test cases:

Data Structures:

Algorithm:
Read in each line from FILE as a string in an array, lines
Iterate over each line in lines
  Print line with substitutions
=end

ADJECTIVES = %w( quick lazy sleepy ugly )
NOUNS = %w( fox dog head leg )
VERBS = %w( jumps lifts bites licks )
ADVERBS = %w( easily lazily noisily excitedly )

FILE = "#{__dir__}/madlibs.txt"

lines = File.readlines(FILE)

lines.each do |line|
  substitutions = {
    noun: NOUNS.sample,
    verb: VERBS.sample,
    adjective: ADJECTIVES.sample,
    adverb: ADVERBS.sample
  }
  print format(line, substitutions)
end

# 8:45
