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
  outcomes.each do | outcome |
    if (check(outcome)) # If this state is final
        if (check(outcome) ==  cpl) # either it is won 
            wins.push(outcome)
        else
            loss.push(outcome) # or lost
        end
    else 
        if (isWinner(outcome)) # uses recursive 
            wins.push(outcome)
        else 
            loss.push(outcome) #same thing
        end
    end
   # now all possibilities are sorted
   # we just need to figure out if it is more possible that we win or lose
        
end
