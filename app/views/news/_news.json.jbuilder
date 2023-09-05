json.extract! news, :id, :title, :user_id, :content, :image, :created_at, :updated_at
json.url news_url(news, format: :json)
