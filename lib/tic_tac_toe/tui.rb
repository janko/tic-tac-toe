require "curses"

require "tic_tac_toe/tui/setup"
require "tic_tac_toe/tui/board"
require "tic_tac_toe/tui/cursor"
require "tic_tac_toe/tui/status"

class TicTacToe
  class TUI # Textual User Inteface
    def initialize
      TUI::Setup.call
    end

    def listen
      loop do
        key = getch
        yield key
      end
    rescue Interrupt
    end

    def board!(*args)
      @board ||= TUI::Board.new(*args)
      @board.update(*args)
    end

    def cursor!(*args)
      @cursor ||= TUI::Cursor.new(@board.window)
      @cursor.update(*args)
    end

    def status!(*args)
      @status ||= TUI::Status.new(@board.window)
      @status.update(*args)
    end

    def clear
      @board.window.close
      Curses.clear
      Curses.refresh

      @board = @cursor = @status = nil
    end

    private

    def getch
      case key = @board.window.getch
      when String  # printable character
        key
      when Integer # special key
        Curses::Key.constants
          .find { |name| Curses::Key.const_get(name) == key }
      end
    end
  end
end
