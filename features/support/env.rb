$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../../', 'lib'))

require 'rspec-expectations'
require 'mohawk'
require 'win32/screenshot'
require 'require_all'

require_all 'lib'

World(Mohawk::Navigation)
Mohawk.app_path = 'calc.exe'

def capture_screenshot(name)
  Dir.mkdir('screenshots') unless Dir.exist? 'screenshots'
  now = Time.now.to_s.gsub(/\W+/, '.')
  Win32::Screenshot::Take.of(:desktop).write("screenshots/#{now}.#{name}.png")
end

Before do
  Mohawk.start
end

After do |scenario|
  capture_screenshot(scenario.name.gsub(/\W+/,'_')) if scenario.failed?
  Mohawk.stop
end
