require 'uri'
class Label
  attr_accessor :name, :artists

  def initialize(name)
    @name = name
    @artists = []
  end

  def add_artist(artist)
    @artists << artist
  end

  def list_artists
    puts "\n🎤 Artists under #{name}:"
    @artists.each { |artist| puts artist }
  end
end

# Child class that inherits from Label
class RunHitLabel < Label
  def initialize
    super("RunHit")
  end
end

# Example usage
runhit = RunHitLabel.new
runhit.add_artist("ST UNIT")
runhit.list_artists

require 'open-uri'
require 'nokogiri'

class RunHitScraper
  attr_accessor :artists

  def initialize(url)
    @url = url
    @artists = []
  end

  # Scrape artist names from RunHit's Artistes page
  def scrape_artists
    begin
      doc = Nokogiri::HTML(URI.open(@url))

      # Extract artist names from <h3 class="elementor-image-box-title">
      @artists = doc.css('.elementor-image-box-title').map { |element| element.text.strip }.uniq

      puts "\n🎤 Artists found on RunHit:"
      @artists.each { |artist| puts artist }
    rescue => e
      puts "❌ Error scraping RunHit: #{e.message}"
    end
  end
end

# Execute the scraper for RunHit
scraper = RunHitScraper.new("https://runhit.fr/nos-artistes/")
scraper.scrape_artists


require 'open-uri'
require 'nokogiri'

class AlMusicRecordsScraper
  attr_accessor :artists

  def initialize(url)
    @url = url
    @artists = []
  end

  # Scrape artist names from Al Music Records
  def scrape_artists
    begin
      doc = Nokogiri::HTML(URI.open(@url))

      # Extract artist names from the provided HTML structure
      @artists = doc.css('.uc_style_image_card_content_box_elementor_title').map { |element| element.text.strip }.uniq

      puts "\n🎤 Artists found on Al Music Records:"
      @artists.each { |artist| puts artist }
    rescue => e
      puts "❌ Error scraping Al Music Records: #{e.message}"
    end
  end
end

# Execute the scraper for Al Music Records
scraper = AlMusicRecordsScraper.new("https://almusicrecords.com/artistes/")
scraper.scrape_artists
require 'open-uri'
require 'nokogiri'

class LabelScraper
  attr_accessor :region, :labels, :artist_pages, :album_titles

  def initialize(region)
    @region = region
    @labels = { "Atipa Record" => "https://atiparecord.com" } if region == "Guyane"
    @labels = { "aztec musique" => "https://aztecmusique.com" } if region == "Martinique"
    @labels = { "hmc label" => "https://hmclabel.com/" } if region == "Guadeloupe"
    @artist_pages = {}
    @album_titles = []
  end

  # Search Bing for music label websites in the given region
  def search_labels
    return if @labels and @labels.any? # Skip Bing search if labels are predefined

    query = "music labels in #{@region}"
    search_url = "https://www.bing.com/search?q=#{URI.encode_www_form_component(query)}"

    begin
      doc = Nokogiri::HTML(URI.open(search_url))
      doc.css('h2 a').each do |link|
        label_name = link.text.strip
        label_url = link['href']
        @labels[label_name] = label_url if label_url.start_with?("http")
      end

      puts "\n🎵 Music labels found in #{@region}:"
      @labels.each { |name, url| puts "#{name} - #{url}" }
    rescue => e
      puts "❌ Error fetching labels: #{e.message}"
    end
  end

  # Scrape each label's website to find artist listings
  def scrape_artists
    @labels.each do |label_name, label_url|
      begin
        doc = Nokogiri::HTML(URI.open(label_url))
        artists = doc.css('p, li, a').map { |element| element.text.strip }.uniq
        @artist_pages[label_name] = artists.reject { |artist| artist.empty? }

        puts "\n🎤 Artists found for #{label_name} (#{@region}):"
        @artist_pages[label_name].each { |artist| puts artist }
      rescue => e
        puts "❌ Error scraping #{label_name}: #{e.message}"
      end
    end
  end

  # Scrape album titles from multiple pages of Atipa Record's productions section
  def scrape_atipa_albums(max_pages = 5)
    return unless @labels.key?("Atipa Record") # Only run for Guyane region

    base_url = "https://atiparecord.com/album-categories/productions/page/"

    (1..max_pages).each do |numero|
      atipa_url = "#{base_url}#{numero}/"
      begin
        doc = Nokogiri::HTML(URI.open(atipa_url))
        albums = doc.css('h2, .album-title').map { |title| title.text.strip }.uniq
        @album_titles.concat(albums)

        puts "\n📀 Albums found on Atipa Record (Page #{numero}):"
        albums.each { |album| puts album }
      rescue => e
        puts "❌ Error scraping Page #{numero}: #{e.message}"
      end
    end
  end

  # Display results
  def display_results
    puts "\n📌 Final list of Artists, their Label, and Region:"
    @artist_pages.each do |label_name, artists|
      artists.each { |artist| puts "#{artist} - #{label_name} (#{@region})" }
    end

    puts "\n📀 Final list of Atipa Record albums:"
    @album_titles.each { |album| puts "Atipa Record - #{album} (Guyane)" }
  end
end

# Execute the script for each region
regions = ["Guadeloupe", "Martinique", "Guyane"]

regions.each do |region|
  scraper = LabelScraper.new(region)
  scraper.search_labels
  scraper.scrape_artists
  scraper.scrape_atipa_albums if region == "Guyane"
  scraper.display_results
end

require 'open-uri'
require 'nokogiri'

class MetisFMScraper
  attr_accessor :artists

  def initialize(max_pages = 10) # Adjust the maximum number of pages as needed
    @artists = []
    @max_pages = max_pages
  end

  # Scrape artist names from all pages of Metis FM Galerie
  def scrape_artists
    base_url = "https://metis.fm/list/galerie/p/"

    (1..@max_pages).each do |page_num|
      url = "#{base_url}#{page_num}?slim=1"

      begin
        doc = Nokogiri::HTML(URI.open(url))

        # Extract artist names from title elements (modify selector if needed)
        titles = doc.css('h2, .title-class').map { |title| title.text.strip }.uniq
        @artists.concat(titles.reject(&:empty?))

        puts "\n🎨 Artists found on Metis FM Galerie (Page #{page_num}):"
        titles.each { |artist| puts artist }
      rescue => e
        puts "❌ Error scraping Metis FM Page #{page_num}: #{e.message}"
        break # Stop scraping if pages run out or errors occur
      end
    end
  end
end

# Execute the scraper for multiple pages
scraper = MetisFMScraper.new(10) # Adjust `10` to the actual number of pages
scraper.scrape_artists

require 'nokogiri'
require 'open-uri'

class AztequeLabel
  attr_accessor :artists

  def initialize
    @artists = []
  end

  def scrape_artists(pages = 5)
    base_url = 'https://aztecmusique.com/category/artistes/page/'

    (1..pages).each do |page_number|
      url = "#{base_url}#{page_number}/"
      doc = Nokogiri::HTML(URI.open(url))

      puts "Scraping Page #{page_number}..."

      doc.css('article.elementor-post').each do |post|
        name = post.at_css('a.elementor-post__thumbnail__link')['href']
        image = post.at_css('img')['src']
        add_artist(name, image)
      end
    end
  end

  def add_artist(name, image_url)
    @artists << { name: name, image: image_url }
  end

  def list_artists
    @artists.each do |artist|
      puts "Artist: #{artist[:name]}"
      puts "Image URL: #{artist[:image]}"
      puts "-" * 40
    end
  end
end

# Example usage:
label = AztequeLabel.new
label.scrape_artists(9) # Scrapes the first 5 pages
label.list_artists



class HMCLabelScraper
  attr_accessor :artists

  def initialize(url)
    @url = url
    @artists = []
  end

  # Scrape artist names from HMC Label's Artistes page
  def scrape_artists
    begin
      doc = Nokogiri::HTML(URI.open(@url))

      # Extract artist names from <h3 class="elementor-icon-box-title">
      @artists = doc.css('.elementor-icon-box-title').map { |element| element.text.strip }.uniq

      puts "\n🎤 Artists found on HMC Label:"
      @artists.each { |artist| puts artist }
    rescue => e
      puts "❌ Error scraping HMC Label: #{e.message}"
    end
  end
end

# Execute the scraper for HMC Label
scraper = HMCLabelScraper.new("https://hmclabel.com/artistes/")
scraper.scrape_artists
require 'open-uri'
require 'nokogiri'

class DonsMusicScraper
  attr_accessor :artists

  def initialize(url)
    @url = url
    @artists = []
  end

  # Scrape artist names from Dons Music
  def scrape_artists
    begin
      doc = Nokogiri::HTML(URI.open(@url))

      # Extract raw artist titles
      raw_titles = doc.css('.title a').map { |element| element.text.strip }.uniq

      # Split using both " x " and "Feat." as separators
      raw_titles.each do |title|
        separated_artists = title.split(/ x |Feat\./i).map(&:strip)
        @artists.concat(separated_artists)
      end

      puts "\n🎤 Artists found on Dons Music:"
      @artists.uniq.each { |artist| puts artist }
    rescue => e
      puts "❌ Error scraping Dons Music: #{e.message}"
    end
  end
end

# Execute the scraper for Dons Music
scraper = DonsMusicScraper.new("https://donsmusic.com/music/")
scraper.scrape_artists


class LabelScraper
  attr_accessor :region, :labels, :artist_pages

  def initialize(region)
    @region = region
    @labels = {}
    @artist_pages = {}
  end

  # Search Bing for music label websites in the given region
  def search_labels
    query = "music labels in #{@region}"
    search_url = "https://www.bing.com/search?q=#{URI.encode_www_form_component(query)}"

    begin
      doc = Nokogiri::HTML(URI.open(search_url))
      doc.css('h2 a').each do |link|
        label_name = link.text.strip
        label_url = link['href']
        @labels[label_name] = label_url if label_url.start_with?("http")
      end

      puts "\n🎵 Music labels found in #{@region}:"
      @labels.each { |name, url| puts "#{name} - #{url}" }
    rescue => e
      puts "❌ Error fetching labels: #{e.message}"
    end
  end

  # Scrape each label's website to find artist listings
  def scrape_artists
    @labels.each do |label_name, label_url|
      begin
        doc = Nokogiri::HTML(URI.open(label_url))
        artists = doc.css('p, li, a').map { |element| element.text.strip }.uniq
        @artist_pages[label_name] = artists.reject { |artist| artist.empty? }

        puts "\n🎤 Artists found for #{label_name} (#{@region}):"
        @artist_pages[label_name].each { |artist| puts artist }
      rescue => e
        puts "❌ Error scraping #{label_name}: #{e.message}"
      end
    end
  end

  # Display artists with label name and region
  def display_results
    puts "\n📌 Final list of Artists, their Label, and Region:"
    @artist_pages.each do |label_name, artists|
      artists.each { |artist| puts "#{artist} - #{label_name} (#{@region})" }
    end
  end
end

# Execute the script for each region
regions = ["Guadeloupe", "Martinique", "Guyane"]

regions.each do |region|
  scraper = LabelScraper.new(region)
  scraper.search_labels
  scraper.scrape_artists
  scraper.display_results
end


class Artist
  attr_accessor :name, :label, :albums

  MUSIC_PROFESSIONS = [
    "Auteur-compositeur-interprète", "Rappeur", "Rappeuse",
    "Auteur", "Compositeur", "Chanteur", "Chanteuse",
    "DJ", "Beatmaker", "Musicien", "Musicienne",
    "Producteur", "Productrice", "Interprète"
  ]

  TERRITORIES = ["Martinique", "Guadeloupe", "Guyane"]

  def initialize(name)
    @name = name
    @label = nil
    @albums = []
  end

  def assign_label(label)
    @label = label
    label.artists << self
  end

  def add_album(title, year)
    @albums << { title: title, year: year }
  end

  def search_wikipedia_professions
    base_url = "https://fr.m.wikipedia.org/w/index.php?search="
    artists_array = []

    MUSIC_PROFESSIONS.each do |profession|
      TERRITORIES.each do |territory|
        search_url = "#{base_url}#{URI.encode_www_form_component(profession + ' ' + territory)}&title=Spécial%3ARecherche&profile=advanced&fulltext=1&ns0=1"
        search_url = URI.encode_www_form_component(search_url)

        begin
          doc = Nokogiri::HTML(URI.open(search_url))
          results = doc.css('div.mw-search-result-heading a').map { |link| { name: link.text, country: territory } }
          artists_array.concat(results)
        rescue => e
          puts "Erreur lors de la récupération des données de #{search_url}: #{e.message}"
        end
      end
    end

    artists_array.uniq # Return unique artists with country info
  end

  def search_youtube_videos
    search_query = "#{@name} official music video"
    url = "https://www.youtube.com/results?search_query=#{URI.encode_www_form_component(search_query)}"
    videos = []

    begin
      doc = Nokogiri::HTML(URI.open(url))
      videos = doc.css('a.yt-simple-endpoint.style-scope.ytd-video-renderer').map { |link| "https://www.youtube.com#{link['href']}" }
    rescue => e
      puts "Erreur lors de la récupération des vidéos YouTube: #{e.message}"
    end

    videos.first(5) # Return top 5 video links
  end
end


# Example usage:
artist = Artist.new("Meryl")
artists_found = artist.search_wikipedia_professions
puts "Artists found from Wikipedia search:"
artists_found.each { |artist| puts "#{artist[:name]} - #{artist[:country]}" }

