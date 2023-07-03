# Madlibs Revisited

DATA_FILENAME = "my_madlibs.txt".freeze
DATA_PATHNAME = "#{__dir__}/#{DATA_FILENAME}".freeze

NOUNS = [
  "yak", "envelope", "car", "velocipede", "claim",
  "abstraction", "undertaker", "urn", "factory",
  "tapir", "anteater", "bard", "defenestration"
].freeze
VERBS = [
  "digsgusts", "overwhelms", "agonizes", "grimaces",
  "enrages", "titrates", "ensorcells", "bemuses",
  "cleaves", "upbraids", "cajoles", "quashes"
].freeze
ADJECTIVES = [
  "oily", "righteous", "monstrous", "puce",
  "unwieldy", "glamorous", "unspeakable", "nameless",
  "hungry", "greedy", "aerodynamic", "slippery"
].freeze
ADVERBS = [
  "heavily", "noisily", "unctuously", "greasily",
  "queasily", "presumptuously", "collectively", "sorely",
  "preemptively", "tangentially", "too", "hatefully"
].freeze

def random_words
  {
    noun: NOUNS.sample,
    verb: VERBS.sample,
    adjective: ADJECTIVES.sample,
    adverb: ADVERBS.sample
  }
end

File.open(DATA_PATHNAME, "r") do |file|
  file.each do |line|
    words = random_words
    puts line % words
  end
end

# LS solution

# ADJECTIVES = %w(quick lazy sleepy ugly).freeze
# NOUNS      = %w(fox dog head leg cat tail).freeze
# VERBS      = %w(spins bites licks hurdles).freeze
# ADVERBS    = %w(easily lazily noisily excitedly).freeze

# File.open("#{__dir__}/madlibs.txt") do |file|
#   file.each do |line|
#     puts format(line, noun:      NOUNS.sample,
#                       verb:      VERBS.sample,
#                       adjective: ADJECTIVES.sample,
#                       adverb:    ADVERBS.sample)
#   end
# end

