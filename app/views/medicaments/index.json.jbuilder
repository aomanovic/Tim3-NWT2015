json.array!(@medicaments) do |medicament|
  json.extract! medicament, :id, :code, :name, :description
  json.url medicament_url(medicament, format: :json)
end
