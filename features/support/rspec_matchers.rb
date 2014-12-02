require "rspec/expectations"

RSpec::Matchers.define :have_content do |expected|
  match do |shell|
    Async.wait_for { shell.content.include?(expected) }
    shell.content.include?(expected)
  end

  failure_message do |shell|
    "expected\n\n#{shell.content}\n\nto match\n\n#{expected}"
  end
end

RSpec::Matchers.define :have_prompt do
  match do |shell|
    Async.wait_for { shell.prompt? }
    shell.prompt?
  end

  failure_message do |shell|
    "expected shell to have prompt"
  end
end
