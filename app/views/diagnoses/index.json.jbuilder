json.array!(@diagnoses) do |diagnosis|
  json.extract! diagnosis, :id, :code, :name, :description
  json.url diagnosis_url(diagnosis, format: :json)
end
