adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg cat)
verbs = %w(jumps lifts bites licks)
adverbs = %w(easily lazyly noisily excitedly)

text = File.read('madlibs_example.txt')
puts text % {adjective: adjectives.sample, verb: verbs.sample, noun: nouns.sample, adverb: adverbs.sample}