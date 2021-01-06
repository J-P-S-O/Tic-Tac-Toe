# This file has the interface library
def cout(board)
  for (i in board):
    print([i[0], i[1], i[2]].join("||"))
end
def cin(board)
  print("Choose a column, 1 - 2 - 3 :")
