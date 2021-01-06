# This file has the interface library
def cout(board)
  board.each do | i |
    print([i[0], i[1], i[2]].join("||"))
  end
end

def cin()
  arr = []
  print("Choose a column, 1 - 2 - 3 :")
  arr[0] = Number(gets.chomp)-1
  puts "Choose a line, 1 -2 -3 "
  arr[1] = Number(gets.chomp) -1
  if (arr[0] > 2 || arr[1] > 2)
    puts "Invalid chars"
    arr = []
    arr = cin()
    return arr
  end
  return arr



end
