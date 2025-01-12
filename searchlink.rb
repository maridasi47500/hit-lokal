require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'certifi'
require 'selenium-webdriver'
require "i18n"
agent = Mechanize.new

@driver = Selenium::WebDriver.for :firefox # Ensure you have Firefox installed or change to another browser
@driver.navigate.to "https://www.google.com"







# Wait for the results to load
wait = Selenium::WebDriver::Wait.new(timeout: 10)
begin
  accept_button = wait.until {
    element = @driver.find_element(css: 'button#L2AGLb') # Adjust selector as needed
    element if element.displayed? && element.text.include?("Tout accepter")
  }
  accept_button.click
rescue Selenium::WebDriver::Error::TimeOutError
  puts "Accept All button not found"
end

# Function to search YouTube for a song and artist
def search_youtube(song, artist)
  query = "#{song} #{artist}"
  # Initialize the WebDriver

  @driver.navigate.to "https://www.google.com"
  

  
  # Wait for the results to load
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  begin
    accept_button = wait.until {
      element = @driver.find_element(css: '[title=Rechercher]') # Adjust selector as needed
      element if element.displayed?
    }
    accept_button.click
  rescue Selenium::WebDriver::Error::TimeOutError
    puts "Accept All button not found"
  end
  # Search for the query
  search_box = @driver.find_element(name: 'q')
  search_box.send_keys(query+" YouTube")
  search_box.submit

  wait.until { @driver.find_element(css: 'div#search') }
  
  # Scrape the results
  results = []
  @driver.find_elements(css: 'div#search div.g').each do |result|
    begin
      title = result.find_element(css: 'h3').text
      link = result.find_element(css: 'a')['href']
      if link.include?('youtube.com')
        results << { title: title, url: link }
      end
    rescue Selenium::WebDriver::Error::NoSuchElementError
      next
    end
  end
  
  # Output the results
  results.each do |result|
    puts "Title: #{result[:title]}"
    puts "URL: #{result[:url]}"

    if result[:url].include?("?v=")
      puts "<a href=\"/ajouter.php?lienvid=#{result[:url].split("v=")[1]}\">ajouter à hit lokal</a>"
    end
    puts "-" * 40
  end
  
  # Close the browser

  results

end

# Example songs

songs = [
  { title: ARGV[1], artist: ARGV[0] }
]
p songs

# Search YouTube for each song
#Chanson.where(url: nil).each do |song|
songs.each do |song|
  results = search_youtube(song[:title], song[:artist])
  
rescue => e
  p "ouille"
  p e.message
  p song.artist
  p song.title
end
@driver.quit

