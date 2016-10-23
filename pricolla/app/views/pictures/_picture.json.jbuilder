json.extract! picture, :id, :name, :user_id, :type, :created_at, :updated_at
json.url picture_url(picture, format: :json)