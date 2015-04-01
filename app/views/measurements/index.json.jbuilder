json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :PersonID, :VP1, :VP2, :VP3, :Date
  json.url measurement_url(measurement, format: :json)
end
