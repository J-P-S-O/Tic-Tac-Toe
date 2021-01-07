# And this  file has the main stuff
def check(board)
  board.each do | i |
    if (i[0] == i[1] && i[1] == i[2])
      return true
    end
  end
end

__END__
A BIG SCRATCH
function check () {
  for (i in board) {
    if (board[i][0] == board[i][1] && board[i][2] == board[i][1] && (board[i][0] != '')) {
      console.log('end first')
      end()
    }
  }
  let counter = 0
  while (counter < 3) {
    if (board[0][counter] == board[1][counter] && board[0][counter] == [board[2][counter]] && (board[0][counter] != undefined) && board[0][counter] != '') {
      console.log(`ended at check ${counter}`)
      end()
    }
    counter++
  }
  if ((board[0][0] == board[2][2] && board[2][2] == board[1][1] && board[1][1] != '') || (board[2][0] == board[1][1] && board[1][1] == board[0][2]) && board[1][1] != '') {
    end()
  }
}
