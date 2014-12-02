class TicTacToe
  class Cursor
    OutOfBounds = Class.new(StandardError)

    attr_reader :field

    def initialize(field = nil, board)
      @field  = field || board.fields.first
      @board  = board

      raise OutOfBounds unless @board.fields.include?(@field)
    end

    def move(direction)
      send(direction)
    rescue TicTacToe::Cursor::OutOfBounds
      self
    end

    private

    def up
      TicTacToe::Cursor.new([x - 1, y], @board)
    end

    def down
      TicTacToe::Cursor.new([x + 1, y], @board)
    end

    def right
      TicTacToe::Cursor.new([x, y + 1], @board)
    end

    def left
      TicTacToe::Cursor.new([x, y - 1], @board)
    end

    def x; field[0]; end
    def y; field[1]; end
  end
end
