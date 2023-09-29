class ArtistsController < ApplicationController
  protect_from_forgery except: [:artiststyle, :artistletters]
  def show
    @artist=Artist.find(params[:ar])
  end
  def artistletters
    @artists = Cat.artistes_l(params[:l],params[:getArtistdata])
    render layout: false, collection: @artists, partial: "artists/myartist"
  end
  def artiststyle
      @top_style = Cat.my_top_style(params[:cat],params[:getArtistdata])
    render layout: false, collection: @artists, partial: "artists/mytopstyle"
  end
  def index
    @allcats=Cat.allcats
    if params[:l].to_s.length > 0
      @artists = Cat.this_artistes_l(params[:l])
      @top_style = Cat.top_style
    elsif params[:cat].to_i > 0
      @artists = Cat.artistes
      @top_style = Cat.this_my_top_style(params[:cat])
    else
      @artists = Cat.artistes
      @top_style = Cat.top_style
    end
  end
end
