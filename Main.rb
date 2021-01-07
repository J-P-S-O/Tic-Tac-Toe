# This is the main File
=begin
board = [
  ['','',''],
  ['','',''],
  ['','','']
]
=end

# uncomment to test
board = [
  ['X','X','X'],
  ['X','X','X'],
  ['X','X','X']
]

require "./interface"
require "./lib"
test = cin()
puts test.join("  ")
cout(board)
