DATA_FILENAME = "test.txt"
DATA_PATHNAME = "#{__dir__}/#{DATA_FILENAME}"
puts DATA_PATHNAME
NOUNS = [
  "yak", "envelope", "car", "velocipede", "claim",
  "abstraction", "undertaker", "urn", "factory",
  "tapir", "anteater", "bard", "defenestration"
]
VERBS = [
  "digsgusts", "overwhelms", "agonizes", "grimaces",
  "enrages", "titrates", "ensorcells", "bemuses",
  "cleaves", "upbraids", "cajoles", "quashes"
]
ADJECTIVES = [
  "oily", "righteous", "monstrous", "puce",
  "unwieldy", "glamorous", "unspeakable", "nameless",
  "hungry", "greedy", "aerodynamic", "slippery"
]
ADVERBS = [
  "heavily", "noisily", "unctuously", "greasily",
  "at long last", "presumptuously", "collectively", "sorely",
  "preemptively", "tangentially", "too", "hatefully"
]

def random_words
  {
    noun: NOUNS.sample,
    verb: VERBS.sample,
    adjective: ADJECTIVES.sample,
    adverb: ADVERBS.sample
  }
end

open(DATA_PATHNAME, "w") do |file|
  file.puts("That %{adjective} %{noun} %{verb} me %{adverb}")
  file.puts("How %{adjective} is your %{noun}? It %{verb} me %{adverb}")
  file.puts("So very %{adverb}, this %{adjective} %{noun} %{verb} us all")
  file.puts("The most %{adjective} among us agree: the %{noun} who %{verb} last, %{verb} %{adverb}")
end

open(DATA_PATHNAME, "r") do |file|
  file.each do |line|
    words = random_words
    puts line % words
  end
end
