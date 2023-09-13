# require 'erb'

# text = File.read("#{__dir__}/erb_test.txt")

# erb = ERB.new(text)

# puts erb.result

require 'yaml'

yaml = YAML.load_file("#{__dir__}/yaml_test.yml")

puts yaml["example"]
