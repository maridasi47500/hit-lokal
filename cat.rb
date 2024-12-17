require 'mechanize'
require 'nokogiri'

# Set up Mechanize
agent = Mechanize.new

# URL of the Wikipedia page
url = 'https://en.wikipedia.org/wiki/List_of_music_genres_and_styles'
url = 'https://en.wikipedia.org/wiki/List_of_Caribbean_music_genres'

# Function to scrape the Wikipedia page for category links
def scrape_categories(url, agent)
  categories = []

  begin
    page = agent.get(url)
    doc = Nokogiri::HTML(page.body)
    doc.css('#mw-content-text .div-col li a').each do |link|
      category_name = link.text.strip
      category_url = "https://en.wikipedia.org" + link['href']
      Cat.find_or_create_by(name: category_name)
      
    end
  rescue Mechanize::ResponseCodeError => e
    puts "Error accessing URL: #{e.message}"
  end

  categories
end

# Scrape the categories
categories = scrape_categories(url, agent)

# Print the categories
categories.each do |category|
  puts "Category: #{category[:name]}, URL: #{category[:url]}"
end

