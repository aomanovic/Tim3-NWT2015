json.array!(@master_medical_facilities) do |master_medical_facility|
  json.extract! master_medical_facility, :id, :Code, :Name, :Address, :Telephone
  json.url master_medical_facility_url(master_medical_facility, format: :json)
end
