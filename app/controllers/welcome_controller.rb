class WelcomeController < ApplicationController
  def index
    @news=News.mostrecentnews
    @mynews=News.mymostrecentnews
    @top=Clip.le_top
    @entreetop=Clip.entree_dans_le_top
  end
end
