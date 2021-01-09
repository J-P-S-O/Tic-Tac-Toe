# And this  file has the main stuff

# checks if game over

def check(board)
  board.each do | i |
    if (i[0] == i[1] && i[1] == i[2] && i[0] != "")
      return i[0]

    end
  end
  counter = 0
  while (counter < 3)
    if (board[0][counter] == board[1][counter] && board[0][counter] == [board[2][counter]] && board[0][counter] != '')
      return board[0][counter]
    end
    counter = counter + 1
  end
 if ((board[0][0] == board[2][2] && board[2][2] == board[1][1] && board[1][1] != '') || (board[2][0] == board[1][1] && board[1][1] == board[0][2]) && board[1][1] != '')
   return board[1][1]
 end
 done  = true
 board.each do |el |
    el.each do | elt |
        if (elt == "")
            done = false
        end 
    end 
 end 
 return done
end

# Detects which player is the next.
# Very important for the minimax algoritm
def getCurrentPlayer(board)
  o = 0
  x = 0
  dummy = 0
  board.each do | el|
    el.each do | elt |
        if (elt == "O")
            o = o + 1
        end
        if (elt == "X")
            x = x+1
        end
        if (elt == "")
            dummy =  0
    end
  end
  if (x>o)
    return "O"
  end
  if (x == o)
    return 'X'
  end

end
end