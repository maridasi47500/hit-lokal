class Clip < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cat
  has_and_belongs_to_many :artists, :join_table => :clipsartists
  after_validation :myfavclip
  attr_accessor :formulaire
  attr_accessor :titrevideo
  def self.nouveautes
    where("created_at > ?", (DateTime.now - 4.month).beginning_of_month).order(sortie: :desc)
  end
  def self.find_with_vid(vid)
    where("parameterize(title) like ?",vid.parameterize)[0]
  end
  def mytitle
    #self.title=self.title.downcase.gsub("k-dilak", "k dilak")
    #self.title=self.title.downcase.gsub("•", "-")
    self.title.downcase.split("-")[1].strip.squish
  rescue
    self.titrevideo
  end
  def myfavclip

    if title.length > 0
      #self.title=self.title.downcase.gsub("k-dilak", "k dilak")
      #self.title=self.title.downcase.gsub("•", "-")
      self.artists = [Artist.find_or_initialize_by(name: self.titrevideo.split("-")[0].strip.squish)]
    end
    
  end
    
  has_many :views, dependent: :destroy

  def nbsemtop
    View.mysqlmyid(id)["nbsem_top"]
  rescue
    "0"
  end
  def meilleurepos
    View.mysqlmyid(id)["ma_mailleure_position"]
  rescue
    ""
  end
  def positionsemderniere
    View.mysqlmyid(id)["ifnull(ce_classement_semaine_derniere2,0)"]
  rescue
    "New"
  end
  def title=(x)
    write_attribute(:title, x.gsub("Official Video","").gsub("(Official Music Video)","").gsub("(clip officiel)","").gsub("(Clip officiel)","").strip.squish)
  end
  def title
    read_attribute(:title)
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
    if self.formulaire == "bonjour"
      self.title= videos.where(id: self.link+',invalid').map(&:title)[0] #pour formulaire
    end
    self.title = self.titrevideo
    self.description= videos.where(id: self.link+',invalid').map(&:description)[0]
    self.sortie= videos.where(id: self.link+',invalid').map(&:published_at)[0].to_date
    thumb=VideoThumb::get("http://www.youtube.com/watch?v=#{self.link}", "medium")
    self.image=thumb
    #system("(cd '#{Rails.root.to_s}/public/uploads' && wget '#{thumb}')")
  end
  def self.entree_dans_le_top
    self.joins(:views).order(created_at: :desc).select("clips.*, count(views.id) as countview").group("clips.id").having("count(views.id) > 0").limit(4)
  end
  def self.le_top
    self.joins(:views).select("clips.*, (select count(views.id) as countview from views group by views.clip_id, strftime('%W',views.created_at) having views.clip_id = clips.id order by countview desc,strftime('%W',views.created_at) desc limit 1) as countviews").group("clips.id").limit(3)
  end
  def myartist
      
    self.titrevideo ? self.titrevideo.split("-")[0].strip.squish : self.artists[0].name
  end
end
