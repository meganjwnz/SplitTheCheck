require "test_helper"
require "capybara"
require "helpers/chrome_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # note: the next line replaces the driven_by :selenium, using: :chrome, screen_size: [1400,1400]
  driven_by :headless_chrome
end
