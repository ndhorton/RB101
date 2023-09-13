# Madlibs Revisited

=begin

Notes:

questions:

Problem:
input:
output:

  Write a program that reads in some text from a file you have created
  and then interpolates randomized nouns, verbs, adjectives and adverbs1

rules:
  word types should be hard-coded
  the body of text should be in a file

Examples:

DS:

Algorithm:

=end

# require 'yaml'

# ADJECTIVES = %w( quick lazy sleepy ugly )
# NOUNS = %w( fox dog head leg )
# VERBS = %w( jumps lifts bites licks )
# ADVERBS = %w( easily lazily noisily excitedly )

# yaml_object = YAML.load_file("#{__dir__}/madlibs.yml")

# lines = yaml_object["sentence1"]

# lines.each do |line|
#   line.strip!
#   line.gsub!(/%{adjective}/, ADJECTIVES.sample)
#   line.gsub!(/%{adverb}/, ADVERBS.sample)
#   line.gsub!(/%{noun}/, NOUNS.sample)
#   line.gsub!(/%{verb}/, VERBS.sample)
#  end
# puts lines

# Alternative solutions, YAML, plaintext, format and %{}, ERB.new and ERB.result and <%= %>
require 'yaml'

ADJECTIVES = %w( quick lazy sleepy ugly )
NOUNS = %w( fox dog head leg )
VERBS = %w( jumps lifts bites licks )
ADVERBS = %w( easily lazily noisily excitedly )

yaml_object = YAML.load_file("#{__dir__}/madlibs.yml")

lines = yaml_object["sentence1"]

# if i'd read this as plaintext in a single string
# it'd be easier to format each word without nesting iterators
lines.map! do |line|
  words = line.split
  words.map! do |word|
    format( word, adjective: ADJECTIVES.sample,
                  adverb: ADVERBS.sample,
                  noun: NOUNS.sample,
                  verb: VERBS.sample )
  end
  words.join(' ')
end
puts lines

require 'erb'

ADJECTIVES = %w( quick lazy sleepy ugly )
NOUNS = %w( fox dog head leg )
VERBS = %w( jumps lifts bites licks )
ADVERBS = %w( easily lazily noisily excitedly )

text = File.read("#{__dir__}/madlibs.txt")
formatted_text = ERB.new(text)
puts formatted_text.result

# 22:49