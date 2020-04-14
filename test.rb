# use ruby 2.5.5

# ------------ABC-------DEF---
# ---1---------2---------3----
# --GHI-------JKL-------MNO---
# ---4---------5---------6----
# --PQRS------TUV-------WXYZ--
# ---7---------8---------9----
# ----------------------------
# ---*---------0---------#----
# ----------------------------
# ----------------------------
require 'byebug'

# ========================problem 1=======================

# PHONE_MAP = {
#   2=> ['A','B', 'C'],
#   3=> ['D','E', 'F'],
#   4=> ['G','H', 'I'],
#   5=> ['J','K', 'L'],
#   6=> ['M','N', 'O'],
#   7=> ['P','Q', 'R', 'S'],
#   8=> ['T','U', 'V'],
#   9=> ['W','X', 'Y', 'Z'],
# }

# def print_phone_as_string(phone_numbers, only_numbers= true)

#   if only_numbers
#     phone_numbers = phone_numbers.gsub(/[\., -]/, '')
#     unless phone_numbers =~ /^\d{8}$/
#       puts "ERROR"
#     end
#   end

#   phone_numbers.each_char.each_with_index do |number, index|
#     if PHONE_MAP[number.to_i]
#       output = phone_numbers.clone
#       PHONE_MAP[number.to_i].each do |replace_char|
#         output[index] = replace_char
#         if output =~ /^[01A-Z]{8}$/
#           puts output
#         else 
#           print_phone_as_string(output, false)
#         end
#       end
#       break
#     end
#   end
# end

# puts "Please input your phone numbers, contains 8 numbers: "
# print_phone_as_string(gets)


# ========================problem 2=======================

def calculate_max_sum_profit(profits, prev_firsti = -1)
  first_index = nil
  last_index = []
  total_profit = 0
  total_profit_by_last_index = []

  profits.each_with_index do |profit, index|
    next if first_index.nil? && profit <= 0 || index <= prev_firsti
    first_index = index if first_index.nil?
    total_profit += profit
    last_index << index
    total_profit_by_last_index << total_profit
  end
  p "==========================================="

  p "first index : ", first_index
  p "last_index : ", last_index
  p "total_profit :", total_profit_by_last_index
  byebug
  calculate_max_sum_profit(profits, first_index)
  
end



# puts "Please input number of square plots(n):"
# n = gets

# profits = []
# (1..n.to_i).each do |index|
#   puts "Please input profit of sware of block #{index}:"
#   profits << (gets).to_i
# end
arr_test = [-5, 0, 1, -6, 4, 3, -5, 0, 2]
arr_test = [1,2,3]
calculate_max_sum_profit(arr_test)
