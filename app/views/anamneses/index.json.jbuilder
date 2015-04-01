json.array!(@anamneses) do |anamnese|
  json.extract! anamnese, :id, :PersonID, :MedicalFacilityID, :DateOfCreation, :UserID, :Remark
  json.url anamnese_url(anamnese, format: :json)
end
