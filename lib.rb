# And this  file has the main stuff
def check(board)
  board.each do | i |
    if (i[0] == i[1] && i[1] == i[2] && i[0] != "")
      return true

    end
  end
  counter = 0
  while (counter < 3)
    if (board[0][counter] == board[1][counter] && board[0][counter] == [board[2][counter]] && (board[0][counter] != undefined) && board[0][counter] != '')
      return true
    end
    counter = counter + 1
  end
 if ((board[0][0] == board[2][2] && board[2][2] == board[1][1] && board[1][1] != '') || (board[2][0] == board[1][1] && board[1][1] == board[0][2]) && board[1][1] != '')
   return true
 end

end
