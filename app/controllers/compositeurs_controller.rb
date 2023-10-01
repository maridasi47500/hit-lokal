class CompositeursController < ApplicationController
  def index
    @artists=User.compositeurs(params[:l])
  end
  def show
    @artist=User.findbyusername(params[:u])
    @myvids=@artist.myvids
    @myothervids=@artist.myothervids
  end
end
