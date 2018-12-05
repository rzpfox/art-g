json.galleries do
  json.array! @galleries do |gallery|
    json.extract! gallery, :id, :name, :description, :address, :phone_number, :photo.url
  end
end
