# This file has the interface library
def cout(board)
  for (i in board):
    print([i[0], i[1], i[2]].join("||"))
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
  return arr
end

def check(board)
  for i in board
    
