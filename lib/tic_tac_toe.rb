class TicTacToe
def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  @board = board
end
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
[0,4,8], [2,4,6]]
def display_board
  row1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  row2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  row3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  sep_line = "-----------"
  puts row1, sep_line, row2, sep_line, row3
end
def input_to_index(user_input)
  user_input = user_input.to_i - 1
end

def move (user_input, user_char)
    @board[user_input] = user_char
end
def position_taken?(index_number)
  if @board[index_number] == " "
    false
  elsif @board[index_number] == "" || @board[index_number] == nil
    false
  else
    true
  end
end

def valid_move? (index)
if index.between?(0,8)
  if position_taken?(index)
    false
  else true
  end
else
  nil
end
end
def turn
  puts "Please enter 1-9:"
  user_choice = gets.strip
  index = input_to_index(user_choice)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "O" || turn == "X"
    counter += 1
    puts "#{counter}"
  end
  end
  counter
end

def current_player
  turn_count.even?? "X" : "O"
end

def won?
  win = nil
  win_token = nil
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win = win_combination
      win_token = "X"
      #break
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win = win_combination
      win_token = "O"
      #break
    end
  end
  return win
end

def full?
  @board.none? {|space| space == " "}
end
def draw?
  if full?
    if won?
      return false
    else
      return true
    end
  else
  end
end

def over?
  if draw?
    return true
  elsif won?
    return true
  else
  end
end

def winner
  win_token = won?
  if win_token
    @board[win_token[0]]
  else
  end
end

def play
  until over? == true
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
