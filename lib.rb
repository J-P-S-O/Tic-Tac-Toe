# And this  file has the main stuff

# checks if game over

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

# Detects which player is the next.
# Very important for the minimax algoritm
def getCurrentPlayer(board)
  o = 0
  x = 0
  dummy = 0
  board.each do | el|
    el.each do | elt |
      case elt
      when "O"
        o+=1
      when "X"
        x++
      else
        dummy++
      end
     end
  end
  if (x>o)
    return "O"
  end
  if (x == o)
    return 'X'
  end

end

# Now we need to get the possible moves
def _moves(board)
  c1 = 0
  c2 = 0

  player = getCurrentPlayer(board)
  free_ = []
  board.each do | el |

    el.each do | elt |
      if (elt == "")
        free_.push(c1.to_s + c2.to_s)
      end
      c2 = c2 + 1
    end
    c1 = c1 + 1
    c2 = 0

  end
  boards_ = []
  free_.each do | opt |
    rs = chBoard(board, opt)
    boards__.push(rs)
  end
  return boards__
end


# This function changes th board. Valid arguments *must* be provided
def chBoard(cur, chg)
  if (chg.class == "Array")
    chg = chg.join("")
  end
  ol = cur
  chg = chg.split()
  ln = chg[0]
  col = chg[1]
  cur[ln][col] = getCurrentPlayer(ol)
  return cur
end
