# This is the main File

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
require "./lib"
test = cin()
puts test.join("  ")
cout(board)
