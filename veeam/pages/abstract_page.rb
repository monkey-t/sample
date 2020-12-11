#coding: utf-8
require 'watir'

class AbstractPage

  attr_reader :browser

  def initialize(browser)
    @browser = browser
  end

  def open_page
    @browser.goto "https://www.tutorialspoint.com/compile_java_online.php"
  end

  def random_word(length)
    charset = Array('A'..'Z') + Array('a'..'z')
    Array.new(length) { charset.sample }.join
  end

  def today_date
    date = Date.today
    today = date.to_s
    today.delete("-")
  end
end