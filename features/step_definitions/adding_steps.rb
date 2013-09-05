When(/^"(.*?)" and "(.*?)" are added together$/) do |first, second|
  on(Calculator) do |screen|
    screen.press(first)
    screen.add
    screen.press(second)
  end
end

Then(/^the result should be "(.*?)"$/) do |expected|
  on(Calculator) do |screen|
    screen.calculate
    screen.result.should eq(expected)
  end
end
