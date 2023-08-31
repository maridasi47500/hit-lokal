class Clip < ApplicationRecord
  has_and_belongs_to_many :artists, :join_table => :clipsartists
  after_validation :myfavclip
  def mytitle
    self.title.split("-")[1].strip.squish
  end
  def myfavclip
    if title.length > 0
      self.artists.new name: self.title.split("-")[0].strip.squish
    end
    
  end
  has_many :views
  def positionsemderniere
    nil
  end
  def fcat=(x)
    write_attribute(:cat_id, x)
  end
  def ytube=(x)
    write_attribute(:link, x)
  end
  def femail=(x)
    write_attribute(:email, x)
  end
  def freg=(x)
    write_attribute(:region, x)
  end
  before_validation :myfunc
  def myfunc
    videos = Yt::Collections::Videos.new
    self.title= videos.where(id: self.link+',invalid').map(&:title)[0]
    self.description= videos.where(id: self.link+',invalid').map(&:description)[0]
    self.sortie= videos.where(id: self.link+',invalid').map(&:published_at)[0].to_date
  end
end
