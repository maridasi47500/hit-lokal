json.extract! post, :id, :user_id, :title, :image, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
