class CompositeursController < ApplicationController
  def index
    @artists=User.compositeurs
  end
end
