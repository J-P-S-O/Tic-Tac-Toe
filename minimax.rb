# This file has the ai algoritm
=begin
License: MIT
Git repository: https://github.com/j-p-s-o/tic-tac-toe
=end

def getNextMove(board)
  require "./lib"
  # here is the magic
  # It uses all the functions defined in other files
  possible = _moves(board)
  _moves.each do | move |
    if (!isWinner(move))
        return move
    end
    end 
    return _moves[rand(_moves.length())]
end



def isWinner(board)
  cpl = getCurrentPlayer(board)
  require "./lib"
=begin
  # this function is the one that uses minimax to determine if
  a board state is ultimately winner or not
  It would be better if we used a `score` mechanism
=end
  outcomes = _moves(board)
  # separates outcomes
  wins = []
  loss = []
  tie = []
  # main loop
  outcomes.each do | outcome |
    if (check(outcome)) # If this state is final
        if (check(outcome) ==  cpl) # either it is won 
            wins.push(outcome)
        elsif (check(outcome) == true)
            tie.push(outcome)
        else
            loss.push(outcome)
        end
    else 
        if (!isWinner(outcome)) # uses recursive, but reverse
            wins.push(outcome)
        else 
            loss.push(outcome) #same thing
        end
    end
   # now all possibilities are sorted
   # we just need to figure out if it is more possible that we win or lose
   if (wins.length() >= loss.length())
     return true
   end 
   return false

end

end

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

def chBoard(cur, chg)
  if (chg.class == "Array")
    chg = chg.join("")
  end
  ol = cur
  chg = chg.split()
  ln = Integer(chg[0])
  col = Integer(chg[1])
  cur[ln][col] = getCurrentPlayer(ol)
  return cur
end
