class TicTacToe
  class TUI
    class Setup
      def self.call
        Curses.init_screen
        at_exit { Curses.close_screen }

        setup_keypress_input!
        enable_colors!
        setup_basic_colors!
      end

      private

      def self.setup_keypress_input!
        Curses.cbreak              # listen for single keypresses (instead of newline)
        Curses.noecho              # don't echo the entered keys

        Curses.nonl                # recognize the "return" key
        Curses.stdscr.keypad(true) # recognize special keys (e.g. arrow keys)
      end

      def self.enable_colors!
        Curses.start_color         # enable colors
        Curses.use_default_colors  # use terminal's default colors (e.g. background)
      end

      def self.setup_basic_colors!
        Curses.init_pair(Curses::COLOR_RED,     Curses::COLOR_RED,     -1)
        Curses.init_pair(Curses::COLOR_BLUE,    Curses::COLOR_BLUE,    -1)
        Curses.init_pair(Curses::COLOR_GREEN,   Curses::COLOR_GREEN,   -1)
        Curses.init_pair(Curses::COLOR_YELLOW,  Curses::COLOR_YELLOW,  -1)
        Curses.init_pair(Curses::COLOR_MAGENTA, Curses::COLOR_MAGENTA, -1)
        Curses.init_pair(Curses::COLOR_CYAN,    Curses::COLOR_CYAN,    -1)
        Curses.init_pair(8,                     235,                   -1) # gray
      end
    end
  end
end
