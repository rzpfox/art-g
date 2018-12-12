json.paintings do
  json.array! @paintings do |painting|
    json.extract! painting, :id, :title, :description, :status, :gallery_id, :artist_id, :photo
  end
end
