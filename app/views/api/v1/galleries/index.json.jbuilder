json.galleries do
  json.array! @galleries do |gallery|
    json.extract! gallery, :id, :name, :address, :phone_number, :photo
  end
end
