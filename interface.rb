# This file has the interface library
def cout(board)
  board.each do | i |
    print([i[0], i[1], i[2]].join("\t"))
    print("\n")
    puts "--------------------"
  end
end

def cin()
  arr = []
  begin
    print("Choose a column, 1 - 2 - 3 ::")
    arr[0] = Integer(gets.chomp)-1
    print "Choose a line, 1 -2 -3:: "
    arr[1] = Integer(gets.chomp) -1
  rescue
    puts "OH NO, SOMETHING WENT (VERY) WRONG"
    cin()
  end
  
  if (arr[0] > 2 || arr[1] > 2 || arr[0] < 0 || arr[1] < 0)
    puts "Invalid chars"
    arr = []
    arr = cin()
    return arr
  end
  return arr
end
