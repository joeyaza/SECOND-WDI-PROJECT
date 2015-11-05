json.array!(@places) do |place|
  json.extract! place, :id, :country, :place, :pic_id
  json.url place_url(place, format: :json)
end
