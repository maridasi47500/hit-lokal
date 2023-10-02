class CompositeursController < ApplicationController
  protect_from_forgery except: [:ajoutermoncompositeur]
  def ajoutermoncompositeur
    @artist=User.find(params[:artist_id])
    @artist.update(compose: true)
    redirect_to tous_composers_path
  end
  def moncompositeur
    @artist=User.findbyusername(params[:u])
  end
  def index
    @artists=User.compositeurs(params[:l])
  end
  def show
    @artist=User.findbyusername(params[:u])
    @myvids=@artist.myvids
    @myothervids=@artist.myothervids
  end
end
