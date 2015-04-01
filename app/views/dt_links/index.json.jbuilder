json.array!(@dt_links) do |dt_link|
  json.extract! dt_link, :id, :DiagnoseID, :TherapyID, :Description
  json.url dt_link_url(dt_link, format: :json)
end
