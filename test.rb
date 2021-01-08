# this file is used for testing

board = [
  ['','',''],
  ['','',''],
  ['','','']
]
=begin
# uncomment to test
board = [
  ['X','X','X'],
  ['X','X','X'],
  ['X','X','X']
]
=end

require "./interface"
require '/minimax'
require "./lib"
require "./main"


test = cin()
puts test.join("  ")
cout(board)
