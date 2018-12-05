json.artists do
  json.array! @artists do |artist|
    json.extract! artist, :id, :name, :bio, :photo.url
  end
end
