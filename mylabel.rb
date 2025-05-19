require 'uri'
require 'open-uri'
require 'nokogiri'

# Always only print artist name, into array

# RunHitLabel
class RunHitLabel < Struct.new(:name, :artists)
  def initialize
    super("RunHit", [])
  end

  def add_artist(artist)
    artists << artist
  end

  def artist_names
    artists
  end
end

runhit = RunHitLabel.new
runhit.add_artist("ST UNIT")
puts runhit.artist_names.inspect

# RunHitScraper
class RunHitScraper
  attr_accessor :artists

  def initialize(url)
    @url = url
    @artists = []
  end

  def scrape_artists
    begin
      doc = Nokogiri::HTML(URI.open(@url))
      @artists = doc.css('.elementor-image-box-title').map { |el| el.text.strip }.uniq
      puts @artists.inspect
    rescue
      puts [].inspect
    end
  end
end

RunHitScraper.new("https://runhit.fr/nos-artistes/").scrape_artists

# AlMusicRecordsScraper
class AlMusicRecordsScraper
  attr_accessor :artists

  def initialize(url)
    @url = url
    @artists = []
  end

  def scrape_artists
    begin
      doc = Nokogiri::HTML(URI.open(@url))
      @artists = doc.css('.uc_style_image_card_content_box_elementor_title').map { |el| el.text.strip }.uniq
      puts @artists.inspect
    rescue
      puts [].inspect
    end
  end
end

AlMusicRecordsScraper.new("https://almusicrecords.com/artistes/").scrape_artists

# LabelScraper
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

  def search_labels
    return if @labels && @labels.any?
    query = "music labels in #{@region}"
    search_url = "https://www.bing.com/search?q=#{URI.encode_www_form_component(query)}"
    begin
      doc = Nokogiri::HTML(URI.open(search_url))
      doc.css('h2 a').each do |link|
        label_name = link.text.strip
        label_url = link['href']
        @labels[label_name] = label_url if label_url.start_with?("http")
      end
    rescue
      @labels ||= {}
    end
  end

  def scrape_artists
    all_artists = []
    @labels.each do |_, label_url|
      begin
        doc = Nokogiri::HTML(URI.open(label_url))
        artists = doc.css('p, li, a').map { |el| el.text.strip }.uniq
        all_artists.concat artists.reject(&:empty?)
      rescue
        next
      end
    end
    puts all_artists.uniq.inspect
  end

  def scrape_atipa_albums(max_pages = 5)
    # not needed for artist names only
  end
end

["Guadeloupe", "Martinique", "Guyane"].each do |region|
  scraper = LabelScraper.new(region)
  scraper.search_labels
  scraper.scrape_artists
end

# MetisFMScraper
class MetisFMScraper
  attr_accessor :artists

  def initialize(max_pages = 10)
    @artists = []
    @max_pages = max_pages
  end

  def scrape_artists
    base_url = "https://metis.fm/list/galerie/p/"
    all_artists = []
    (1..@max_pages).each do |page_num|
      url = "#{base_url}#{page_num}?slim=1"
      begin
        doc = Nokogiri::HTML(URI.open(url))
        titles = doc.css('h2, .title-class').map { |title| title.text.strip }.uniq
        all_artists.concat(titles.reject(&:empty?))
      rescue
        break
      end
    end
    #puts all_artists.uniq.inspect
    titles= all_artists.uniq
    artists = titles.map do |title|
      # Only process if there is a dash (hyphen, en dash, em dash)
      if title =~ /\s*[-–—]\s*/
        # Split by any dash, join all but last segment (for cases with multiple dashes)
        title.split(/\s*[-–—]\s*/)[0...-1].join(' - ').strip
      else
        nil
      end
    end.compact.uniq
    
    puts artists.inspect

  end


end

MetisFMScraper.new(10).scrape_artists

# Filter: keep only those with a dash (artist – title), extract artist part before the last dash


# AztequeLabel
class AztequeLabel
  attr_accessor :artists

  def initialize
    @artists = []
  end

  def scrape_artists(pages = 5)
    base_url = 'https://aztecmusique.com/category/artistes/page/'
    (1..pages).each do |page_number|
      url = "#{base_url}#{page_number}/"
      begin
        doc = Nokogiri::HTML(URI.open(url))
        doc.css('h6.elementor-post__title').map do |h6|
          # Get text, split on dash (en dash, em dash, or hyphen), take first part and strip
          h6.text.split(/\s+[-–—]\s+/).first.strip
        end

      rescue
        next
      end
    end
    puts @artists.inspect
  end

  def add_artist(name)
    @artists << name
  end
end

AztequeLabel.new.scrape_artists(9)

# HMCLabelScraper
class HMCLabelScraper
  attr_accessor :artists

  def initialize(url)
    @url = url
    @artists = []
  end

  def scrape_artists
    begin
      doc = Nokogiri::HTML(URI.open(@url))
      @artists = doc.css('.elementor-icon-box-title').map { |el| el.text.strip }.uniq
      puts @artists.inspect
    rescue
      puts [].inspect
    end
  end
end

HMCLabelScraper.new("https://hmclabel.com/artistes/").scrape_artists

# DonsMusicScraper
class DonsMusicScraper
  attr_accessor :artists

  def initialize(url)
    @url = url
    @artists = []
  end

  def scrape_artists
    begin
      doc = Nokogiri::HTML(URI.open(@url))
      raw_titles = doc.css('.title a').map { |el| el.text.strip }.uniq
      all_artists = []
      raw_titles.each do |title|
        separated_artists = title.split(/ x |Feat\./i).map(&:strip)
        all_artists.concat(separated_artists)
      end
      puts all_artists.uniq.inspect
    rescue
      puts [].inspect
    end
  end
end

DonsMusicScraper.new("https://donsmusic.com/music/").scrape_artists

# Wikipedia/YouTube search (artist names only)
class Artist
  attr_accessor :name

  MUSIC_PROFESSIONS = [
    "Auteur-compositeur-interprète", "Rappeur", "Rappeuse",
    "Auteur", "Compositeur", "Chanteur", "Chanteuse",
    "DJ", "Beatmaker", "Musicien", "Musicienne",
    "Producteur", "Productrice", "Interprète"
  ]

  TERRITORIES = ["Martinique", "Guadeloupe", "Guyane"]

  def initialize(name)
    @name = name
  end

  def search_wikipedia_professions
    base_url = "https://fr.m.wikipedia.org/w/index.php?search="
    artists_array = []
    MUSIC_PROFESSIONS.each do |profession|
      TERRITORIES.each do |territory|
        search_url = "#{base_url}#{URI.encode_www_form_component(profession + ' ' + territory)}&title=Spécial%3ARecherche&profile=advanced&fulltext=1&ns0=1"
        begin
          doc = Nokogiri::HTML(URI.open(search_url))
          results = doc.css('div.mw-search-result-heading a').map { |link| link.text }
          artists_array.concat(results)
        rescue
          next
        end
      end
    end
    puts artists_array.uniq.inspect
  end
end

Artist.new("Meryl").search_wikipedia_professions
