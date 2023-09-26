class Cat < ApplicationRecord

  def self.top_style
    Clip.all.joins("views").select("clips.*, count(views.id) nbclips").group("clips.id,clips.cat_id").order("sortie" => "asc","nbclips" => "desc").limit(5)
  end
  def self.artistes
    Artist.all.sample(6)

    #Artist.all.joins("clips").select("artists.*, (select myclips.sortie from clips myclips where myclips.artist_id = artists.id order sortie desc limit 1) masortie").group("artists.id, artists.cat_id").order("masortie" => "asc")
  end
  def self.my_top_style(cat,mydata)
    Clip.all.joins("views").select("clips.*, count(views.id) nbclips,(case when clips.id = #{mydata} then 1 else 0 end )  OVER (ROWS UNBOUNDED PRECEDING)as mytest").group("clips.id,clips.cat_id").having(["cat_id = ? and mytest > 0",cat,mydata]).order("sortie" => "asc").limit(5)
  end
  def self.artistes_l(l,mydata)
    Artist.all.select("artists.*,(case when artists.id = #{mydata} then 1 else 0 end )  OVER (ROWS UNBOUNDED PRECEDING) as mytest").group("artists.id").having(["lower(name) like ? and mytest > 0", "#{l.downcase}%", mydata]).order(name: :asc).limit(6)
  end
end
