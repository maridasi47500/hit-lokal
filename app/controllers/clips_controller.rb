require 'open-uri'
require 'nokogiri'
class ClipsController < ApplicationController
  before_action :set_clip, only: %i[ show edit update destroy ]

  # GET /clips or /clips.json
  def index
    @clips = Clip.all
  end

  # GET /clips/1 or /clips/1.json
  def showclip
    @clip = Clip.find_with_vid((params[:vid]||params[:title]))

    render :show
  end
 def lien
    @results=`ruby searchlinkbing.rb "#{params[:artist]}" "#{params[:title]}"`
 end



  
  def artist_origin(artist_name)
    url = "https://fr.wikipedia.org/wiki/#{artist_name.gsub(' ', '_')}"
    
    begin
      page = Nokogiri::HTML(URI.open(url))
  
      # Trouver l'infobox
      infobox = page.css('.infobox_v3')
  
      artist_info = {}
      artist_info[:nom] = infobox.css('.entete div').text.strip
      artist_info[:image_url] = infobox.css('.images img').attr('src').value
      artist_info[:naissance] = page.css('th:contains("Naissance") + td').text.strip
      artist_info[:origine] = page.text.downcase.include?("Portail de la musique") && (page.text.downcase.include?("martinique") || page.text.downcase.include?("guadeloupe") || page.text.downcase.include?("guyane"))
  
      return artist_info[:origine]
    rescue
      return false
    end
  end
  def extract_artists_title(video_title)
    return ["Inconnu"], "Titre inconnu" if video_title.strip.empty?
  
    artists_title = video_title.split(/[-,&]/).map(&:strip)
    return ["Inconnu"], video_title if artists_title.size < 2
  
    artists = artists_title[0..-2] # Tous sauf le dernier élément
    title = artists_title[-1] # Dernier élément = titre
  
    return artists, title
  end

  
  
  def my_trending_videos
    region = { "FR" => "France" }
    @results = ""
  
    region.each do |code, name|
      videos = Yt::Collections::Videos.new
      trending = videos.where(chart: 'mostPopular', regionCode: code, categoryId: '10')
      results = ""
  
      trending.each do |video|
        artists, title = self.extract_artists_title(video.title)
        if artists.any?{|artist|artist_origin(artist)}
          results << "<p>Title: #{title}</p>"
          results << "<p>Artist: #{artist}</p>"
          results << "<p>URL: #{video.id}</p>"
          results << "<a href=\"/ajouter.php?lienvid=#{video.id}&titre=#{video.title.gsub('#','').gsub('(','').gsub(')','').gsub(' - YouTube','').gsub(' ','%20')}\">ajouter à hit lokal</a>"
          results << "<hr>"
        end
      end
      results

      @results << "<h2>Tendances en #{name}</h2>"
      @results << results
    end
  end

 def autrelien

    video = Yt::Video.new id: params[:channel1]
    channel = Yt::Channel.new id: video.channel_id 
    @results=""
    channel.videos.take(300).each do |vid|
      @results << "<p>Title: #{vid.title}</p>"
      @results << "<p>URL: #{vid.id}</p>"

      @results << "<a href=\"/ajouter.php?lienvid=#{vid.id}&titre=#{vid.title.gsub("#","").gsub("(","").gsub(")","").gsub(" - YouTube","").gsub(" ","%20")}\">ajouter à hit lokal</a>"
      @results << "<hr>"
    end


 end
  def show
    View.create(clip_id: @clip.id)
  end

  # GET /clips/new
  def new
    @clip = Clip.new
  end

  # GET /clips/1/edit
  def edit
  end

  # POST /clips or /clips.json
  def create
    @clip = Clip.new(clip_params)

    respond_to do |format|
      if @clip.save
        format.html { redirect_to clip_url(@clip), notice: "Clip was successfully created." }
        format.json { render :show, status: :created, location: @clip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clips/1 or /clips/1.json
  def update
    respond_to do |format|
      if @clip.update(clip_params)
        format.html { redirect_to clip_url(@clip), notice: "Clip was successfully updated." }
        format.json { render :show, status: :ok, location: @clip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clips/1 or /clips/1.json
  def destroy
    @clip.destroy

    respond_to do |format|
      format.html { redirect_to clips_url, notice: "Clip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clip
      @clip = Clip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clip_params
      params.permit(:titrevideo,:formulaire,:fcat, :ytube, :femail, :freg, :video,:user_id)
    end
end
