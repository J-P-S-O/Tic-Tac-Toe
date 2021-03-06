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
# SCORE AI
def getScore(board)
    cpl = getCurrentPlayer(board)
    outcomes = _moves(board)

    score = 0
  # main loop
  outcomes.each do | outcome |
    if (check(outcome)) # If this state is final
        if (check(outcome) ==  cpl) # either it is won
            score += 9
        elsif (check(outcome) == true)
            score += 1
        else
            score -= 9
        end
    else
        score -= getScore(outcome)
    end
   end 
   # now all possibilities are sorted
   # we just need to figure out if it is more possible that we win or lose
   
   return score

       

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



def getNextMove(board)

  # here is the magic
  # It uses all the functions defined in other files
  possible = _moves(board)
  max = possible[0]
  count = 0
  possible.each do | pos | 
    if (getScore(pos) >= getScore(max))
        max = possible[count]
    end
  return max 
end



def isWinner(board)
  cpl = getCurrentPlayer(board)

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
   end 
   # now all possibilities are sorted
   # we just need to figure out if it is more possible that we win or lose
   if (wins.length() >= loss.length())
     return true
   end
   return false

end

end
# WIP HERE, ISSUE IS THAT SOMEHOWW RESULT DOES NOT DIE
def _moves(board)
  c1 = 0
  c2 = 0
   # DEBUG:
  puts "Board"
  cout(board)
  olboard = board

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
  fixissue_ = olboard
  free_.each do | opt |
    # # DEBUG:

    boards_.push(chBoard(board,opt))
    board = fixissue_
    #cout (board)
  end
  # DEBUG INFO
  #puts "debug boards__"
  #boards_.each do | board |
  #  cout(board)
  #end
  return boards_
end

def chBoard(currrr, chg)
  cur = currrr # fix an issue here.
  # puts chg # debug
  # puts chg.class
  puts "Got input"
  begin #cout(cur)
    puts chg
    chg = chg.split("")
  rescue
    dummy = 0
    # comment
  end
  # puts chg


  c3 = 0
  c4 = 0

  ln = Integer(chg[0])
  col = Integer(chg[1])
  brandnewboard = [
    ['','',''],
    ['','',''],
    ['','','']
  ]
  brandnewboard.each do | step |
    step.each do | space |
      if (c3 == ln && c4 == col)
        step[c4] = getCurrentPlayer(currrr)
      else
        step[c4] = currrr[c3][c4]
      end

      c4 = c4 +1
    end
    c3 = c3 + 1
    c4 = 0
  end

  puts "returned  #{cout(brandnewboard)}"
  return brandnewboard
end






puts "Welcome to the ruby tictactoe game! I doubt you can win"
puts "Ill start the game"
while true
    move = getNextMove(board)
    puts move # debug
    board = move
    puts board
    win = check(board)
    if (win)
        puts win
        puts "gameover"
        cout(board)
        exit(0)
    end

    puts "YOUR TURN: "
    # debug info game ends here for some reason
    cout(board)
    cl = cin()
    board[Integer(cl[0])][Integer(cl[1])] = "O"
    win = check(board)
    if (win)
        puts win
        puts "gameover"
        cout(board)
        exit(0)
    end
    puts board
    cout(board)
end
