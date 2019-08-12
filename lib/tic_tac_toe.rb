class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, user_marker)
    @board[index.to_i] = user_marker
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, user_marker = current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" or token == "O"
        counter += 1 #counter = counter
      end
    end
  counter
  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| @board[idx] == "X"}
        winner = combo
      elsif combo.all? {|idx| @board[idx] == "O"}
        winner = combo
      else
        false
      end
    end
    if winner != nil
      winner
    else
      false
    end
  end
  
  def full?
    @board.all? {|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end
  
  def check_win_combination?(player, win_combo)
  win_combo.all? do |position|
    @board[position] == player
    end
  end

  def winner
    if !won?
      return nil
    else
      WIN_COMBINATIONS.each do |win_combo|
        if check_win_combination?('X', win_combo)
          return 'X'
        elsif check_win_combination?('O', win_combo)
          return 'O'
        end
      end
    end
  end

  def play
    while !over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    else
      return nil
    end
  end
end