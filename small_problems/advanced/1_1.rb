# Madlibs Revisited
=begin
P:
input: some kind of text file
output: The text from that file with randomized
-adjectives
-nouns
-verbs
-adverbs
inserted into it at appropriate points
I guess you could use non-text characters and substitute
in a randomized word of appropriate class
adjectives: {
nouns: }
verbs: &
adverbs: `

E:
The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.

The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.

=end

PATH = "/home/nicholas/launch_school/rb101/small_problems/advanced/".freeze

# adjectives = %w(quick lazy sleepy ugly)
# nouns = %w(fox dog head leg)
# verbs = %w(jumps lifts bites licks)
# adverbs = %w(easily lazily noisily excitedly)

# file = File.open("/home/nicholas/launch_school/rb101/small_problems/advanced/madlibs.txt")
# lines = file.readlines
# file.close
# lines.map! { |line| line.chomp }
# lines.each do |line|
#   line.gsub!(/{/, adjectives.sample)
#   line.gsub!(/}/, nouns.sample)
#   line.gsub!(/&/, verbs.sample)
#   line.gsub!(/`/, adverbs.sample)
# end
# puts lines

# LS solution but with an attempt at better file hygiene
# However,
# "The method File.open also opens a file. In regular use, it behaves
# just like File.new . However, if there's a block associated with the call,
# File.open behaves differently. Instead of returning a new File object, it
# invokes the block, passing the newly opened File as a parameter. When the
# block exits, the file is automatically closed."
# So the original LS solution is actually fine vis-a-vis file identifiers not being
# wasted, etc

# ADJECTIVES = %w(quick lazy sleepy ugly).freeze
# NOUNS      = %w(fox dog head leg).freeze
# VERBS      = %w(jumps lifts bites licks).freeze
# ADVERBS    = %w(easily lazily noisily excitedly).freeze

# madfile = File.open("#{PATH}madlibs_ls.txt")
# lines = madfile.readlines.map { |line| line.chomp }
# madfile.close
# lines.each do |line|
#   puts format(line, noun:      NOUNS.sample,
#                     verb:      VERBS.sample,
#                     adjective: ADJECTIVES.sample,
#                     adverb:    ADVERBS.sample)
# end

# Original LS solution

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg).freeze
VERBS      = %w(jumps lifts bites licks).freeze
ADVERBS    = %w(easily lazily noisily excitedly).freeze

File.open("#{PATH}madlibs_ls.txt") do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end