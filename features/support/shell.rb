class Shell
  def initialize(name)
    @name = name
    start
    at_exit { exit }
  end

  def start
    tmux "new-session -c '#{Dir.pwd}' -d 'bash'"
  end

  def exit
    tmux "kill-server"
  end

  def reset
    tmux "respawn-window -k"
    Async.wait_for { prompt? }
  end

  def type(keys)
    tmux "send-keys '#{keys}'"
  end

  def enter(command)
    type command
    type "Enter"
    Async.wait_for { not content.end_with?(command) }
  end

  def content
    tmux "capture-pane"
    unindent(`#{tmux} show-buffer`).strip
  end

  def prompt?
    /\$\Z/ === content
  end

  private

  def tmux(command = nil)
    if command
      system "tmux -L #{@name} #{command}"
    else
      "tmux -L #{@name}"
    end
  end

  def unindent(string)
    indent = string.scan(/^[ \t]+(?=\S)/).min
    string.gsub(/^#{indent}/, "")
  end
end
