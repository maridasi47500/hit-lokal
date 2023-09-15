class News < ApplicationRecord
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
