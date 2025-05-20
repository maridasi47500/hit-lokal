require 'open-uri'
require 'uri'
require 'nokogiri'
require 'json'

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

      #puts "\n🎵 Music labels found in #{@region}:"
      #@labels.each { |name, url| puts "#{name} - #{url}" }
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

        #puts "\n🎤 Artists found for #{label_name} (#{@region}):"
        #@artist_pages[label_name].each { |artist| puts artist }
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

#regions.each do |region|
#  scraper = LabelScraper.new(region)
#  scraper.search_labels
#  scraper.scrape_artists
#  scraper.display_results
#end


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


  
  BASE_URL = "https://fr.m.wikipedia.org/w/index.php"
  def search_wikipedia_professions

    artists_array = []
  
    MUSIC_PROFESSIONS.each do |profession|
      TERRITORIES.each do |territory|
        params = {
          search: "#{profession} #{territory}",
          title: "Spécial:Recherche",
          profile: "advanced",
          fulltext: "1",
          ns0: "1"
        }
  
        query = URI.encode_www_form(params)
        search_url = "#{BASE_URL}?#{query}"
        page = 1
  
        loop do
          #puts "🔍 Fetching Page #{page}: #{search_url}"
  
          begin
            doc = Nokogiri::HTML(URI.open(search_url))
            results = doc.css('div.mw-search-result-heading a').map { |link| { name: link.text, country: territory } }
            artists_array.concat(results)
  
            # Find pagination link for next page
            next_page_link = doc.at_css("a:contains('Suivant')")
            break unless next_page_link # Stop if no more pages exist
  
            search_url = BASE_URL + next_page_link['href']
            page += 1
  
          rescue => e
            #puts "❌ Erreur lors de la récupération des données de #{search_url}: #{e.message}"
            break
          end
        end
      end
    end
  
    #puts "\n🎭 Liste des artistes trouvés:"
    #artists_array.uniq.each { |artist| puts "#{artist[:name]} - #{artist[:country]}" }
    artists_array.uniq

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
puts JSON.pretty_generate({"artists" => artists_found})

