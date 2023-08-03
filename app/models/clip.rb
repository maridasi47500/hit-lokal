class Clip < ApplicationRecord
  has_many :views
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
  end
end
