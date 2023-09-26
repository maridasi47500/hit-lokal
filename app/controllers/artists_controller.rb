class ArtistsController < ApplicationController
  def show
    @artist=Artist.find(params[:ar])
  end
  def artistletters
    @artists = Cat.artistes_l(params[:l]).offset(6)
    render layout: false, collection: @artists, partial: "artists/myartist"
  end
  def artiststyle
      @top_style = Cat.my_top_style(params[:cat])
    render layout: false, collection: @artists, partial: "artists/mytopstyle"
  end
  def index
    if params[:l].to_s.length > 0
      @artists = Cat.artistes_l(params[:l],params[:getArtistdata])
      @top_style = Cat.top_style
    elsif params[:cat].to_i > 0
      @artists = Cat.artistes
      @top_style = Cat.my_top_style(params[:cat],params[:getArtistdata])
    else
      @artists = Cat.artistes
      @top_style = Cat.top_style
    end
  end
end
