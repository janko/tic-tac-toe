class TicTacToe
  class TUI
    class Cursor
      X_SPACING = 2
      X_MARGIN  = 1

      Y_SPACING = 4
      Y_MARGIN  = 2

      def initialize(window)
        @window = window
      end

      def update(field, hidden: false)
        update_position(field)
        update_visibility(hidden)
      end

      private

      def update_position(field)
        x, y = field
        position = [x * X_SPACING + X_MARGIN, y * Y_SPACING + Y_MARGIN]
        @window.setpos(*position)
      end

      def update_visibility(hidden)
        if hidden
          Curses.curs_set(0)
        end
      end
    end
  end
end
