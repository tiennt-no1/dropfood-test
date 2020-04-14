# ========================problem 2=======================

BlockSet = Struct.new(:first, :last, :sum_profit)

def cal_max_profit(profits, prev_firsti = -1, best_block_set = nil)
  best_block_set ||= BlockSet.new(0, 0, 0)
  sum_profit = 0
  first = nil
  profits.each_with_index do |profit, index|
    next if first.nil? && profit <= 0 || index <= prev_firsti
    sum_profit += profit
    first = index if first.nil?
    tmp_set = BlockSet.new(first, index, sum_profit)
    if tmp_set.sum_profit > best_block_set.sum_profit
      best_block_set = tmp_set
    end
  end

  if first && first < (profits.size - 1)
    cal_max_profit(profits, first, best_block_set) 
  else
    best_block_set
  end
end
# profits = [-5,0,7,-6,4,3,-5,0,2]

puts "Please input number of square of blocks(n):"
n = gets

profits = []
(1..n.to_i).each do |index|
  puts "Please input profit of block #{index}:"
  profits << (gets).to_i
end

best_block_set = cal_max_profit(profits)
puts "#{best_block_set.first+1} #{best_block_set.last+1} #{best_block_set.sum_profit}"