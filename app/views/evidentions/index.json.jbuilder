json.array!(@evidentions) do |evidention|
  json.extract! evidention, :id, :AnamnesisID, :PersonID, :MedicalStuffID, :Date, :Remark
  json.url evidention_url(evidention, format: :json)
end
