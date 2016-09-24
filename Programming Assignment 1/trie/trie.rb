require  'byebug'

class Trie
  attr_accessor :adj
  def initialize
    @adj = {}
    @adj[root] = {}
  end

  def root
    0
  end

  def add_edge(n1, n2, letter)
    @adj[n1] = {} if @adj[n1].nil?
    @adj[n1][letter] = n2
  end
end

def build_trie(patterns)
  trie = Trie.new
  node_count = 0
  patterns.each do |pattern|
    current = trie.root
    pattern.split("").each do |letter|
      if trie.adj[current] && trie.adj[current][letter]
        current = trie.adj[current][letter]
      else
        node_count += 1
        trie.add_edge(current, node_count, letter)
        current = node_count
      end
    end
  end
  trie
end

if $PROGRAM_NAME == __FILE__
  patterns = $stdin.read.split[1..-1]
  trie = build_trie(patterns)
  trie.adj.each do |node, children|
    children.each do |letter, child_node|
      puts "#{node}->#{child_node}:#{letter}"
    end
  end
end
