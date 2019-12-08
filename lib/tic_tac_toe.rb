class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end



WIN_COMBINATIONS= [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(input)
     index = input.to_i - 1
     return index
  end


  def move(index, current_player)
      @board[index] = current_player
  end


  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
        return position_taken = false
    elsif @board[index] == "X" || @board[index] == "O"
      return position_taken = true
    else
      return position_taken = true
    end
  end


  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip;
      index = input_to_index(user_input);
      token = current_player

      if valid_move?(index)
          puts 'Valid Move!'
          move(index, token)
          display_board
      else
          puts 'Try Again!'
          turn
      end
  end


  def turn_count
      @board.count{|token| token == "X" || token == "O"}
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
    WIN_COMBINATIONS.detect do |position|
      if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X"
        position
      elsif @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
        position
      else
        nil
      end
    end
   end


   def full?
     @board.all? do |cell|
     cell == "X" || cell == "O"
     end
   end


   def draw?
       if !won? && full?
         true
       end
   end


   def over?
         if won? || full? || draw?
           true
         else
           false
         end
   end


   def winner
        if solution = won?
          @board[solution.first]
        else
          nil
        end
   end


   def play
     until over? == true
       turn
     end

     if won? != nil
       puts "Congratulations #{winner}!"
     elsif draw? == true
       puts "Cat's Game!"
     end
   end


end
