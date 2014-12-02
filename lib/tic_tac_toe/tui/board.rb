require "strscan"

class TicTacToe
  class TUI
    class Board
      SYMBOL_COLORS = {
        "x" => Curses::COLOR_RED,
        "○" => Curses::COLOR_BLUE,
        "△" => Curses::COLOR_YELLOW,
        "□" => Curses::COLOR_GREEN,
        "◇" => Curses::COLOR_MAGENTA,
      }
      COLOR_GRAY = 8

      attr_reader :window

      def initialize(board)
        @window = new_window(board)
        update(board)
      end

      def update(board)
        symbols = SYMBOL_COLORS.keys
        scanner = StringScanner.new(board)

        redraw do
          loop do
            box_part = scanner.scan_until(/(?=#{Regexp.union(*symbols, /\Z/)})/)
            write_box(box_part)

            break if scanner.eos?

            symbol = scanner.getch
            write_symbol(symbol, SYMBOL_COLORS.fetch(symbol))
          end
        end
      end

      private

      def new_window(board)
        height = board.lines.count
        width  = board.lines.first.length
        top    = (Curses.lines / 2) - (height / 2)
        left   = (Curses.cols / 2) - (width / 2)

        Curses::Window.new(height, width, top, left).tap do |window|
          window.keypad(true)
        end
      end

      def write_box(string)
        @window.attron(Curses.color_pair(COLOR_GRAY)) do
          @window.addstr(string)
        end
      end

      def write_symbol(symbol, color)
        @window.attron(Curses.color_pair(color)) do
          @window.addstr(symbol)
        end
      end

      def redraw
        cursor_position = [@window.cury, @window.curx]
        @window.clear
        yield
        @window.setpos(*cursor_position)
      end
    end
  end
end
