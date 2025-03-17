require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'certifi'
require 'selenium-webdriver'
require 'i18n'

agent = Mechanize.new

@driver = Selenium::WebDriver.for :firefox # Ensure you have Firefox installed or change to another browser
@driver.navigate.to "https://www.bing.com"

def search_bing(song, artist)
  query = "#{song} #{artist} youtube"
  @driver.navigate.to "https://www.bing.com"

  # Wait for the results to load
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @driver.find_element(name: 'q') }
  
  # Search for the query
  search_box = @driver.find_element(name: 'q')
  search_box.send_keys(query)
  search_box.submit
  
  wait.until { @driver.find_element(css: 'li.b_algo') }
  
  # Scrape the results
  results = []
  doc = Nokogiri::HTML(@driver.page_source)
  doc.css('li.b_algo').each do |li|
    a_tag = li.at_css('h2 a')
    next unless a_tag

    url = a_tag['href']
    title = a_tag.text.strip
    link_element = li.at_css('link[rel="dns-prefetch"]')
    if link_element
      url = link_element['href']
      a_tag = "<a href=\"#{url}\">#{title}</a>"
      #puts a_tag
    else
      #puts "Link element with dns-prefetch not found"
      p "==========="
    end
    next unless url.include?('youtube.com')

    # Form the desired output format
    inner_html = "<a href=\"#{url}\">#{title}</a>"
    results << {
      title: title,
      url: url,
      inner_html: inner_html
    }
  end
  
  # Output the results
  results.each do |result|
    puts "Title: #{result[:title]}"
    puts "URL: #{result[:url]}"

    if result[:url].include?("?v=")
      puts "<a href=\"/ajouter.php?lienvid=#{result[:url].split("v=")[1]}&titre=#{result[:title].gsub(" - YouTube","").gsub(" ","%20")}\">ajouter à hit lokal</a>"
    end
    puts "-" * 40

  end
  
  # Extracting URL and Title from dns-prefetch link


  # Close the browser
  results
end

# Example songs
songs = [
  { title: ARGV[1], artist: ARGV[0] }
]

p songs

# Search Bing for each song
songs.each do |song|
  results = search_bing(song[:title], song[:artist])
rescue => e
  p "Ouille"
  p e.message
  p song[:artist]
  p song[:title]
end

@driver.quit

