require 'mechanize'
require 'nokogiri'

# Set up Mechanize
agent = Mechanize.new

# URL of the Qobuz genres page
url = 'https://www.qobuz.com/ch-fr/genres/download-streaming-albums'

# Function to scrape Qobuz for genre links
def scrape_genre_links(url, agent)
  genre_links = []

  begin
    page = agent.get(url)
    doc = Nokogiri::HTML(page.body)

    # Extracting genre links that contain '/genre/'
    doc.css('a').each do |link|
      href = link['href']
      if href && href.include?('/genre/')
        Cat.find_or_create_by(name: link.text.strip)
      end
    end
  rescue Mechanize::ResponseCodeError => e
    puts "Error accessing URL: #{e.message}"
  end

  genre_links
end

# Scrape the genres
genre_links = scrape_genre_links(url, agent)

# Print the genre links
genre_links.each do |genre_link|
  puts "Genre Link: #{genre_link}"
end

