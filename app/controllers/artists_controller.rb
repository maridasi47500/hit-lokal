class ArtistsController < ApplicationController
  def show
    @artist=Artist.find(params[:ar])
  end
end
