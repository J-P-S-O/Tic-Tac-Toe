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
    if (check(outcome))
        if (check(outcome) ==  cpl)
            wins.push(outcome)
        else
            loss.push(outcome)
        end
    else 
        if (isWinner(outcome ))

        
end
