require_relative '../test_helper'

class GoogleTest < MiniTest::Test
  def setup
    @driver = Selenium::WebDriver.for(:chrome)
  end

  def teardown
    @driver.quit
  end

  def test_search
    @driver.navigate.to "http://www.google.com"
    element = @driver.find_element(:name, 'q')
    element.send_keys "Test"
    element.submit
    assert_equal(@driver.title, "Test - Google Search")
  end

  def test_reddit
    @driver.navigate.to "http://www.reddit.com"
    element = @driver.find_element(name: "user")
    element.send_keys "test@test.com"
  end


end

