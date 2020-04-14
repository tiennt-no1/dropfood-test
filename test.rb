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

# ========================problem 1=======================

PHONE_MAP = {
  2=> ['A','B', 'C'],
  3=> ['D','E', 'F'],
  4=> ['G','H', 'I'],
  5=> ['J','K', 'L'],
  6=> ['M','N', 'O'],
  7=> ['P','Q', 'R', 'S'],
  8=> ['T','U', 'V'],
  9=> ['W','X', 'Y', 'Z'],
}

def print_phone_as_string(phone_numbers, only_numbers= true)

  # validate phone numbers only first time(not recursive)
  if only_numbers
    phone_numbers = phone_numbers.gsub(/[\., -]/, '')
    unless phone_numbers =~ /^\d{8}$/
      puts "ERROR"
    end
  end

  phone_numbers.each_char.each_with_index do |number, index|
    if PHONE_MAP[number.to_i]
      output = phone_numbers.clone
      PHONE_MAP[number.to_i].each do |replace_char|
        output[index] = replace_char
        if output =~ /^[01A-Z]{8}$/
          # all numbers is converted
          puts output
        else
          # continue convert to end of phone numbers
          print_phone_as_string(output, false)
        end
      end
      break # just find the first number convertable then recursive to the end
    end
  end
end

puts "Please input your phone numbers, contains 8 numbers: "
print_phone_as_string(gets)