class User < ApplicationRecord
  has_many :clips
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.realisateurs(l)
    if l.to_s.length > 0
    all.where(prod: true).where("lower(username) like ?", l.downcase+"%")
    else
    all.where(prod: true)
    end
  end
  def self.compositeurs(l)
    if l.to_s.length > 0
    all.where(compose: true).where("lower(username) like ?", l.downcase+"%")
    else
    all.where(compose: true)
    end
  end
  def self.findbyusername(x)
    where("parameterize(username) like ?",x)[0]
  end
  def myvids
    clips.limit(5)
  end
  def myothervids
    clips.offset(5)
  end
end
