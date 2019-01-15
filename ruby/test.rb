(1..10).to_a.each {|n| puts "This is sentense #{n}"}
rand  = rand(10)
while input = gets
    puts 'greater' if input.to_i > rand
    puts 'less' if input.to_i < rand
    break if input.to_i == rand
end
def tell_the_truth
    true
end
puts tell_the_truth
puts "string".object_id
puts "string".object_id
puts :string.object_id
puts :string.object_id