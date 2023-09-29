class Cat < ApplicationRecord
  has_many :clips
  def self.allcats
    joins(:clips).group("cats.id")
  end

  def self.top_style_by_lip
    Clip.all.joins(:views).select("clips.*, count(views.id) nbclips").group("clips.cat_id,clips.id").order("sortie asc,nbclips desc")
  end
  def self.top_style
    Clip.all.joins(:views).select("clips.*, count(views.id) nbclips").group("clips.cat_id").order("sortie asc,nbclips desc").limit(5)
  end
  def self.artistes
    Artist.all.sample(6)

    #Artist.all.joins("clips").select("artists.*, (select myclips.sortie from clips myclips where myclips.artist_id = artists.id order sortie desc limit 1) masortie").group("artists.id, artists.cat_id").order("masortie" => "asc")
  end
  def self.this_my_top_style(cat)
    Clip.all.joins(:views).select("clips.*, count(views.id) nbclips").group("clips.id,clips.cat_id").having(["cat_id = ?",cat]).order("sortie" => "asc").limit(5)
  end
  def self.my_top_style(cat,mydata)
    Clip.all.joins(:views).select("clips.*, count(views.id) nbclips,(case when clips.id = #{mydata} then 1 else 0 end )  OVER (ROWS UNBOUNDED PRECEDING)as mytest").group("clips.id,clips.cat_id").having(["cat_id = ? and mytest > 0",cat]).order("sortie" => "asc").limit(5)
  end
  def self.this_artistes_l(l)
    Artist.all.select("artists.*").group("artists.id").having(["lower(name) like ?", "#{l.downcase}%"]).order(name: :asc).limit(6)
  end
  def self.artistes_l(l,mydata)
    Artist.all.select("artists.*,(case when artists.id = #{mydata} then 1 else 0 end )  OVER (ROWS UNBOUNDED PRECEDING) as mytest").group("artists.id").having(["lower(name) like ? and mytest > 0", "#{l.downcase}%", mydata]).order(name: :asc).limit(6)
  end
end
