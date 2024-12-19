require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'certifi'
require 'selenium-webdriver'
require "i18n"
agent = Mechanize.new

@driver = Selenium::WebDriver.for :firefox # Ensure you have Firefox installed or change to another browser
@driver.navigate.to "https://www.google.com"

def search_musical_style(song, artist, agent)
  query = "qobuz #{artist.split("feat")[0]} #{song} genres musical".gsub(' ', '+').downcase
  query = query.gsub('.', '')
  query = query.gsub('&', '')
  query = query.gsub('-', '')
  query = query.gsub('++', '+')
  p query
  url = "https://www.google.com/search?q=#{query}"
  p url

  begin
    page = URI.open(url.downcase)
    p "hey"
    p page
    doc = Nokogiri::HTML(page.read).to_s.downcase
  rescue  => e
    puts "Error accessing URL: #{e.message}"
    return nil
  end

  # Extract all cat names and check if they are included in the document
  cats = Cat.all
  index_to_cat = {}
  p index_to_cat

  cats.where("length(name) >= 3").each do |cat|
      yesok=I18n.transliterate(cat.name.downcase)
      if doc.include?(yesok)
        yeah=doc.index(yesok)
        index_to_cat[yeah]= cat.name
      end

  end
  p index_to_cat

  # Find the cat with the smallest index
  matching_cat = index_to_cat.min_by { |index, _| index}&.last
  p matching_cat
  matching_cat

end






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
    puts "-" * 40
  end
  
  # Close the browser

  results

end

# Example songs

songs = [
  { title: 'Shape of You', artist: 'Ed Sheeran' },
  { title: 'Blinding Lights', artist: 'The Weeknd' }
]

# Search YouTube for each song
Chanson.where(url: nil).each do |song|
#Chanson.all.each do |song|
  results = search_youtube(song.title, song.artist)
  
  song.update(url: results[0][:url])
  #artiste=Artist.find_or_create_by(name: song.artist)
  konpa=search_musical_style(song.title, song.artist,agent)
  cat=Cat.find_or_create_by(name:konpa)
  k=Clip.new(user_id:1,cat_id:cat.id,title:song.artist+" - "+song.title,description: "Music video for #{song.title} by #{song.artist}", link: results[0][:url].split("?v=")[1], email: "info@example.com", region: "1111", video: true, sortie: Date.today)

  p k
  if k.save
    results.each do |result|
      puts "Titre: #{result[:title]}, URL: #{result[:url]}"
    end
  end
rescue => e
  p "ouille"
  p e.message
  p song.artist
  p song.title
end
@driver.quit

