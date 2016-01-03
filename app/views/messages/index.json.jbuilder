json.array!(@messages) do |message|
  json.extract! message, :id, :user_id, :content, :link, :has_read, :level
  json.url message_url(message, format: :json)
end
