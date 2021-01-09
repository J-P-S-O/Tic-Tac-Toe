# This is the main File
# it is the one that binds everything together
board = [
  ['','',''],
  ['','',''],
  ['','','']
]

require "./interface"
require "./lib"
require "./minimax"
require "./lib"
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
