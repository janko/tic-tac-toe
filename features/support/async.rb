require "timeout"

module Async
  module_function

  def wait_for(&block)
    Timeout.timeout(3) do
      sleep 0.01 until block.call
    end
  rescue Timeout::Error
  end
end
