require 'nokogiri'
require 'open-uri'
require 'mechanize'
require 'certifi'
require 'selenium-webdriver'
require "i18n"
agent = Mechanize.new


# Function to search Google for the musical style of a song
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





Chanson.all.each do |song|
  
  konpa=search_musical_style(song.title, song.artist,agent)
  p song.artist
  p song.title
  p konpa
rescue => e
  p "ouille"
  p e.message
  p song.artist
  p song.title
end
@driver.quit

require 'mechanize'
require 'nokogiri'

# Set up Mechanize
agent = Mechanize.new

# Function to perform Google search and process each result
def google_search(query, agent)
  search_url = "https://www.google.com/search?q=#{query.gsub(' ', '+')}"
  
  begin
    page = agent.get(search_url)
    doc = Nokogiri::HTML(page.body)
  
    results = []
  
    # Extracting search result links and descriptions
    doc.css('div.yuRUbf').each do |result|
      title = result.css('h3').text.strip
      url = result.css('a')['href']
      description = result.css('span').text.strip
      results << { title: title, url: url, description: description }
    end
  
    results
  rescue Mechanize::ResponseCodeError => e
    puts "Error accessing URL: #{e.message}"
    []
  end
end

# Example query
query = 'zouk konpa music style'

# Perform Google search
results = google_search(query, agent)

# Process each result
results.each do |result|
  puts "Title: #{result[:title]}"
  puts "URL: #{result[:url]}"
  puts "Description: #{result[:description]}"
  puts "-" * 40
end

