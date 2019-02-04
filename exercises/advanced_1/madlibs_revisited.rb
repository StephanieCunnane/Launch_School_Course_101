NOUNS = %w(cat dog fish lizard).freeze
VERBS = %w(runs jumps sleeps wakes).freeze
ADJECTIVES = %w(big little black white).freeze
ADVERBS = %w(quickly slowly easily loudly).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun: NOUNS.sample, verb: VERBS.sample, adjective: ADJECTIVES.sample, adverb: ADVERBS.sample)
  end
end
