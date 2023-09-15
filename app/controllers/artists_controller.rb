class ArtistsController < ApplicationController
  def show
    @ærtist=Artist.find(params[:ar])
  end
end
