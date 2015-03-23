json.array!(@therapies) do |therapy|
  json.extract! therapy, :id, :code, :name, :description
  json.url therapy_url(therapy, format: :json)
end
