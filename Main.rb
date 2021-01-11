# This is the main File
# it is the one that binds everything together
board = [
  ['','',''],
  ['','',''],
  ['','','']
]


# And this  part has a lib

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

require "./interface"


# This part has the ai algoritm
=begin
License: MIT
Git repository: https://github.com/j-p-s-o/tic-tac-toe
=end

def getNextMove(board)

  # here is the magic
  # It uses all the functions defined in other files
  possible = _moves(board)
  possible.each do | move |
    if (!isWinner(move))
        return move
    end
    end
    return possible[rand(possible.length())]
end



def isWinner(board)
  cpl = getCurrentPlayer(board)
=begin
  # this function is the one that uses minimax to determine if
  a board state is ultimately winner or not
  It would be better if we used a `score` mechanism
=end
  outcomes = _moves(board)
=begin
  puts "debug from line isWinner #1"
  puts outcomes.length()
  outcomes.each do | out |
    puts "# debug outcome "
    cout(out)
  end
=end
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
   # DEBUG:
  puts "Board"
  cout(board)

  player = getCurrentPlayer(board)
  # debug output
  puts player
  free_ = []
  board.each do | el |

    el.each do | elt |
      # debug
      puts "elt #{ elt }"
      if (elt == "")
        free_.push(c1.to_s + c2.to_s)
        #debug
        puts "added to free_"
      end
      c2 = c2 + 1
    end
    c1 = c1 + 1
    c2 = 0

  end
  boards_ = []
  free_.each do | opt |
    # # DEBUG:
    puts "opt #{ opt } found for free"
    rs = chBoard(board, opt)
    # debug
    puts "result output found"
    puts "DEBUG"
    cout(rs)
    boards_.push(rs)
    rs = board
  end
  # DEBUG INFO 
  puts "debug "
  boards_.each do | board |
    cout(board)
  end
  return boards_
end

def chBoard(cur, chg)
  # puts chg # debug
  # puts chg.class
  if (chg.class == "Array")
    chg = chg.join("")
  end
  # puts chg
  ol = cur
  chg = chg.split("")

  ln = Integer(chg[0])

  col = Integer(chg[1])
  cur[ln][col] = getCurrentPlayer(ol)
  return cur
end





# and this part starts the game
me = "X"
puts "Welcome to the ruby tictactoe game! I doubt you can win"
puts "Ill start the game"
while true
    move = getNextMove(board)
    puts move # debug
    board = move
    win = check(board)
    if (win)
        puts win
        puts "gameover"
        cout(board)
        exit(0)
    end

    # debug info game ends here for some reason
    cout(board)
    cl = cin()
    chBoard(cl)
    win = check(board)
    if (win)
        puts win
        puts "gameover"
        cout(board)
        exit(0)
    end
    cout(board)
end
