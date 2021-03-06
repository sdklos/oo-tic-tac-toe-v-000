class TicTacToe

def initialize
  @board = Array.new(9, " ")
end

WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, char="X")
  @board[index] = char
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
if valid_move?(index) == true
  move(index, current_player)
  display_board
else
  until valid_move?(index) == true
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  valid_move?(index)
end
end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |win_combination_array|
    win_index_1 = win_combination_array[0]
    win_index_2 = win_combination_array[1]
    win_index_3 = win_combination_array[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      win_combination_array
    end
  end
end

def full?
  @board.all? do |square|
    if square == "X" || square == "O"
      true
    end
  end
end

def draw?
  if won? == nil && full? == true
    true
  end
end

def over?
  if draw? == true || won? != nil || full? == true
    true
  end
end

def winner
  WIN_COMBINATIONS.detect do |win_combination_array|

  win_index_1 = win_combination_array[0]
  win_index_2 = win_combination_array[1]
  win_index_3 = win_combination_array[2]

  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 == "X"
  return "X"
    elsif position_1 == position_2 && position_2 == position_3 && position_1 == "O"
  return "O"
    end
end
end

def play
  while !over?
  turn
end
  if over? == true && won? != nil && winner == "X"
    puts "Congratulations X!"
  elsif over? == true && won? != nil && winner == "O"
    puts "Congratulations O!"
  elsif over? == true && draw? == true
    puts "Cat's Game!"
  elsif over? == true
    puts "Cat's Game!"
  end
end

end
