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

  # Fonction pour récupérer les vidéos tendances par région
  def trending_videos(region_code)
    videos = Yt::Collections::Channels.new
    trending = videos.where(chart: 'mostPopular', regionCode: region_code)
    results=""
  
    trending.each do |video|
      puts "#{video.title} - #{video.id}"
      results << "<p>Title: #{vid.title}</p>"
      results << "<p>URL: #{vid.id}</p>"

      results << "<a href=\"/ajouter.php?lienvid=#{vid.id}&titre=#{vid.title.gsub("#","").gsub("(","").gsub(")","").gsub(" - YouTube","").gsub(" ","%20")}\">ajouter à hit lokal</a>"
      results << "<hr>"
    end
  end
  
  # Codes régionaux pour Martinique, Guadeloupe et Guyane
  def my_trending_videos
    regions = { "FR" => "Martinique", "GP" => "Guadeloupe", "GF" => "Guyane" }
    @results=""
    
    regions.each do |code, name|
      @results << "<h2>Tendances en #{name}</h2>"
      @results << self.trending_videos(code)
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
