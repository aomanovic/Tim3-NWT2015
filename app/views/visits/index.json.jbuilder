json.array!(@visits) do |visit|
  json.extract! visit, :id, :PersonID, :Date, :MedicalStuffID
  json.url visit_url(visit, format: :json)
end
