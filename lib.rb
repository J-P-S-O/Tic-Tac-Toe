# And this  file has the main stuff
def check(board)
  board.each do | i |
    if (i[0] == i[1] && i[1] == i[2])
      return true
    end
  end
end
