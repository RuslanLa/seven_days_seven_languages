def print_by_four(helper, el)
    helper.push el
    if(helper.length == 4)
        puts "#{helper.shift} #{helper.shift} #{helper.shift} #{helper.shift}" 
    end
end

a = (0..15).to_a
h = []
a.each {|el| print_by_four(h, el)} 
a.each_slice(4) {|part| puts part.inject {|prev, el| prev.to_s+" "+el.to_s}}
