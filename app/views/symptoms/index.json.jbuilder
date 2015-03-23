json.array!(@symptoms) do |symptom|
  json.extract! symptom, :id, :code, :name, :description
  json.url symptom_url(symptom, format: :json)
end
