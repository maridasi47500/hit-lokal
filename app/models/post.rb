class Post < ApplicationRecord
  def self.mostrecent
   order(created_at: :desc).limit(1)
  end
end
