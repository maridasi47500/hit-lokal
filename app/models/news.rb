class News < ApplicationRecord
belongs_to :user
has_many :views, class_name: "Viewnews"
has_many :comments
	def resumearticle
          content
        end

def lastnew
News.where.not(id: self.id).order(created_at: :desc).limit(4)
end
def othernew(lastnew)
News.joins(:views).select("news.*, count(viewnews.id) as countview").group("news.id").having.not(id: self.id).having.not(id: lastnew.ids).order("countview" => "desc").limit(4)
end
  def self.findnews(vid)
    where("parameterize(title) like ?",vid.parameterize)[0]
  end

def self.mostrecentnews
self.order(created_at: :desc).limit(1)
end
def self.mymostrecentnews
self.order(created_at: :desc).limit(6)
end
def image
read_attribute(:image)
end
def image=(uploaded_io)
File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  file.write(uploaded_io.read)
end
write_attribute(:image,uploaded_io.original_filename)
end
end
