class TicTacToe

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  # ETC, an array for each win combination
]

def initialize()
  @board = [' ', ' ', ' ',
            ' ', ' ', ' ',
            ' ', ' ', ' ']
end

def position_taken?( index)
  !(@board[index].nil? || @board[index] == " ")
end

def won?()
  WIN_COMBINATIONS.each do |win|
    if (@board[win[0]] == @board[win[1]]) && (@board[win[1]] == @board[win[2]]) && (@board[win[0]] != " ") && (@board[win[0]] != "")
      return (win)
    end
  end
  false
end


def draw?()
  (full?() && !won?())
end


def full?()
  @board.each do |item|
    if !((item == "X") || (item == "O"))
      return false
    end
  end
  true
end


def over?()
  return(won?() || draw?())
end


def play()
  turn() until over?()
  if won?()
    puts "Congratulations #{winner()}!"
  elsif draw?()
    puts "Cat's Game!"
  end
end

def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts '-----------'
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts '-----------'
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?( index)
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def turn()
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?( index)
    move(index, current_player())
    display_board()
  else
    turn
  end
end

def position_taken?(index)
  @board[index] == 'X' || @board[index] == 'O'
end

def current_player()
  turn_count.even? ? 'X' : 'O'
end

def turn_count()
  @board.count { |token| token == 'X' || token == 'O' }
end

def move( index, player)
  @board[index] = player
end

def winner()
  if winning_combo = won?
    @board[winning_combo.first]
  end
end
 

end
