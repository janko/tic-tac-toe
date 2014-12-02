Before do
  $shell ||= Shell.new("tic-tac-toe")
  $shell.reset
end

Given(/^I run "(.+)"$/) do |command|
  $shell.enter("bundle exec #{command}")
end

When(/^I press (.+)$/) do |keys, *args|
  keys.scan(/\w+/).each { |key| $shell.type(key) }
end

Then(/^I should see$/) do |output|
  expect($shell).to have_content(output)
end

Then(/^I should see "(.+)"$/) do |output|
  expect($shell).to have_content(output)
end

Then(/^the game should be over$/) do
  expect($shell).to have_prompt
end
