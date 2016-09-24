require 'byebug'
require_relative './../trie/trie.rb'

def prefixTrieMatching(text, trie)
  idx = 0
  v = trie.root
  loop do
    if trie.adj[v].nil? || trie.adj[v].empty?
      return text[0...idx]
    elsif trie.adj[v][text[idx]]
      v = trie.adj[v][text[idx]]
      idx += 1
    else
      return nil
    end
  end
end

def trieMatching(text, trie)
  result = []
  text.length.times do |i|
    result << i if prefixTrieMatching(text[i..-1], trie)
  end
  result
end

def solve(text, n, patterns)
  trie = build_trie(patterns)
  result = trieMatching(text, trie)
end

text = gets.chomp
n = gets.chomp.to_i
patterns = []
n.times do
  patterns += [gets.chomp]
end

result = solve(text, n, patterns)

puts result.join(' ')
