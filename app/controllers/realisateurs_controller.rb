class RealisateursController < ApplicationController
  def index
    @artists=User.realisateurs
  end
end
