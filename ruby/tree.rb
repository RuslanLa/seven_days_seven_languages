class Tree 
    attr_accessor :children, :node_name
    
    def initialize(name, children=[])
        @children = children
        @node_name = name
    end
    
    def visit_all(&block)
        visit &block
        @children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

class Hash
    def to_tree
        arr = self.to_a
        arr.map {|el| Tree.new(el[0], el[1].to_tree)}
    end
end


ruby_tree = Tree.new( "Ruby",
    [Tree.new("Reia"),
    Tree.new("MacRuby")])

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

puts "Initializing from Hash"

hash_tree = {'grandpa'=>{'dad'=>{'child1'=>{}, 'child2'=>{}}, 'uncle'=>{'child3'=>{}, 'child4'=>{}}}}.to_tree
hash_tree[0].visit_all {|node| puts node.node_name}