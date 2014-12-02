require "tic_tac_toe/board"
require "tic_tac_toe/player"
require "tic_tac_toe/cursor"
require "tic_tac_toe/rules"
require "tic_tac_toe/tui"

class TicTacToe
  def initialize(size: 3, number_of_players: 2, goal: 3)
    @board   = TicTacToe::Board.new(size)
    @players = TicTacToe::PlayerList.new(number_of_players)
    @cursor  = TicTacToe::Cursor.new(@board)
    @rules   = TicTacToe::Rules.new(goal)
  end

  def start
    @tui = TicTacToe::TUI.new
    setup

    @tui.listen do |key|
      handle_keypress(key) unless game_over?
    end
  end

  private

  def setup
    @tui.board!(@board.to_s)
    @tui.cursor!(@cursor.field)
    @tui.status!(@players.to_a, @players.current)
  end

  def handle_keypress(key)
    case key
    when :UP, :DOWN, :RIGHT, :LEFT
      move(key.downcase)
    when "h", "j", "k", "l"
      direction = {"h" => :left, "j" => :down, "k" => :up, "l" => :right}[key]
      move(direction)
    when " "
      mark
      if game_over?
        @tui.cursor!(@cursor.field, hidden: true)
        @tui.status!(@players.to_a)
      end
    when :RESIZE
      @tui.clear
      setup
    end
  end

  def move(direction)
    @cursor = @cursor.move(direction)
    @tui.cursor!(@cursor.field)
  end

  def mark
    return if @board.marked?(@cursor.field)

    @board = @board.mark(@cursor.field, @players.current.symbol)
    @tui.board!(@board.to_s)

    @players.next!
    @tui.status!(@players.to_a, @players.current)
  end

  def game_over?
    @rules.game_over?(@board, @players)
  end
end
