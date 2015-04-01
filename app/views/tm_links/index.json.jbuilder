json.array!(@tm_links) do |tm_link|
  json.extract! tm_link, :id, :TherapyID, :MedicamentID, :Quantity, :Description
  json.url tm_link_url(tm_link, format: :json)
end
